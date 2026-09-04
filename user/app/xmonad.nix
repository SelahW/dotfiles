{pkgs, ...}: {
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    extraPackages = hPkgs: [ hPkgs.xmobar ];
    config = ./xmonad/xmonad.hs;
  };
}
