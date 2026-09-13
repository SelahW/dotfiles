{pkgs, ...}: 
  let 
    identity = import ../identity.nix;
    logos = {
      nixos = " ";
      arch = "󰣇 ";
      ubuntu = " ";
      debian = " ";
      fedora = " ";
      mint = "󰣭 ";
      macos = " ";
    };
    logo = logos.${identity.distro} or "\u00e712";
    cfgTemplate =
    ''
      Config { overrideRedirect = True
        , font     = "FantasqueSansM Nerd Font"
        , bgColor  = "#272E33"
        , fgColor  = "#D3C6AA"
        , position = TopH 30
        , commands = [ Run Weather "KMKE"
        [ "--template", " <weather> <tempF>°F"
          , "-L", "32"
          , "-H", "75"
          , "--low"   , "#7FBBB3"
          , "--normal", "#A7C080"
          , "--high"  , "#E67E80"
        ] 36000
        , Run Cpu
        [ "--template", "\xf4bc  <total>%"
          , "-L", "3"
          , "-H", "50"
          , "--high"  , "#E67E80"
          , "--normal", "#A7C080"
        ] 10
        , Run Memory ["--template", "\xefc5  <usedratio>%"] 10
        , Run Swap [] 10
        , Run Date "%a %m-%d <fc=#83C092>\xf017  %H:%M</fc>" "date" 10
        , Run XMonadLog
    '';
  in {
    programs.xmobar = {
      enable = true;
      extraConfig = cfgTemplate + (
      if identity.isLaptop then ''
        , Run BatteryP ["${identity.batteryID}"] ["--template", "<acstatus>"
        , "-W", "0"
        , "-f", "󰁺󰁻󰁼󰁽󰁾󰁿󰂀󰂁󰂂󰁹"
        , "--"
        , "-O", "<fc=#A7C080>󱐋 <leftbar> <left>%</fc>"
        , "-o", "<leftbar> <left>%"
        , "-L", "20"
        , "-H", "80"
        , "-l", "#E67E80"
        , "-h", "#A7C080"
        ] 50
        ]
        , sepChar  = "%"
        , alignSep = "}{"
        , template = " ${logo} | %XMonadLog% }{ %cpu% | %memory% | %KMKE% | %battery% | %date% "
    }
    '' else ''
        ]
        , sepChar  = "%"
        , alignSep = "}{"
        , template = " ${logo}| %XMonadLog% }{ %cpu% | %memory% | %KMKE% | %date% "
    }
    '');
  };
}
