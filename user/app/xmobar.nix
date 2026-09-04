{pkgs, ...}: {
    programs.xmobar = {
      enable = true;
      extraConfig = ''
        Config { overrideRedirect = True
          , font     = "Iosevka Comfy Semi-Bold Italic 11"
            , bgColor  = "#272E33"
            , fgColor  = "#D3C6AA"
            , position = TopH 30
            , commands = [ Run Weather "KMKE"
            [ "--template", "<weather> <tempF>°F"
            , "-L", "32"
              , "-H", "75"
              , "--low"   , "#7FBBB3"
              , "--normal", "#D3C6AA"
              , "--high"  , "#E67E80"
            ] 36000
            , Run Cpu
            [ "-L", "3"
            , "-H", "50"
              , "--high"  , "#E67E80"
              , "--normal", "#A7C080"
            ] 10
            , Run Memory ["--template", "Mem: <usedratio>%"] 10
            , Run Swap [] 10
            , Run Date "%a %Y-%m-%d <fc=#83C092>%H:%M</fc>" "date" 10
            , Run XMonadLog
            ]
            , sepChar  = "%"
            , alignSep = "}{"
            , template = "%XMonadLog% }{ %cpu% | %memory% | %KMKE% | %date% "
        }
      '';
    };
}
