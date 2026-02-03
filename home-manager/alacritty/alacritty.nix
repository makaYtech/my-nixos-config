{ pkgs, ... }: {
  home.packages = [ pkgs.alacritty ];

  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.85;
        decorations = "None";
        dynamic_title = true;
        dimensions = {
          columns = 120;
          lines = 40;
        };
      };

      scrolling = {
        history = 5000;
        multiplier = 3;
      };

      colors = {
        primary = {
          background = "#1d2021";
          foreground = "#ebdbb2";
        };

        cursor = {
          text = "#665c54";
          cursor = "#bdae93";
        };

        selection = {
          text = "#ebdbb2";
          background = "#d65d0e";
        };

        normal = {
          black = "#3c3836";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };

        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#fbf1c7";
        };
      };

      hints = {
        enabled = [{
          regex = "(ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)";
          command = "xdg-open";
          post_processing = true;
          mouse = {
            enabled = true;
          };
        }];
      };

      mouse = {
        hide_when_typing = false;
      };
    };
  };
}