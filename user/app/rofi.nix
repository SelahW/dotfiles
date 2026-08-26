{pkgs, config, ...}: {
# Based on https://github.com/dennis-n-schneider/rofi-everforest/
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
  };
  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
      modi: "drun,run,window";
      show-icons: false;
      display-drun: "run:";
      drun-display-format: "{name}";
      disable-history: false;
      sidebar-mode: false;
    }

    * {
      font: "IosevkaTerm Nerd Font Medium 12";
      
      bg-dark: #232a2e;     
      bg-alt: #2d353b;      
      bg-selection: #a7c080;
      fg-zero: #d3c6aa;     
      fg-selected: #232a2e; 
      
      background-color: transparent;
      text-color: @fg-zero;
      spacing: 0;
    }

    window {
      anchor: north;
      location: north;
      width: 100%;
      padding: 0px;
      border: 0px 0px 1px 0px;
      border-color: #3d484d;
      background-color: @bg-dark;
      children: [ mainbox ];
    }

    mainbox {
      orientation: horizontal;
      children: [ inputbar, listview ];
    }

    inputbar {
      background-color: @bg-alt;
      children: [ prompt, entry ];
    }

    prompt {
      padding: 4px 12px;
      background-color: @bg-selection;
      text-color: @fg-selected;
      font: "GoMono Nerd Font Bold 12";
    }

    entry {
      padding: 4px 8px;
      text-color: @fg-zero;
      width: 15%;
    }

    listview {
      layout: horizontal;
      spacing: 12px;
      padding: 4px 8px;
    }

    element {
      padding: 0px 6px;
      background-color: @bg-dark;
      text-color: @fg-zero;
    }

    element alternate normal {
      background-color: @bg-dark;
      text-color: @fg-zero;
    }

    element normal normal {
      background-color: @bg-dark;
      text-color: @fg-zero;
    }

    element selected normal {
      background-color: @bg-selection;
      text-color: @fg-selected;
      border-radius: 2px;
    }

    element-text {
      text-color: inherit;
    }
  '';
}
