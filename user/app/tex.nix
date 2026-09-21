pkgs:
  pkgs.texliveBasic.withPackages (ps: with ps; [
    latexmk
    mathtools
    enumitem
    tikz-cd
    pgf
    etoolbox
    amsmath
    amsfonts
    amscls
    graphics
    hyperref
  ])
