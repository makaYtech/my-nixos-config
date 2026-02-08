{ pkgs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      startup = [
        { 
          command = "swaybg -i ${./wallpaper.png}";
          always = true;
        }
        { 
          command = "mako";
          always = true; 
        }
        { 
          command = "waybar";
          always = true;
        }
        {
          command = "wl-paste --watch cliphist store";
          always = true;
        }
        {
          command = "wl-clipboard-history -t";
          always = true;
        }
        {
          command = "wl-clip-persist --clipboard regular";
          always = true;
        }
      ];
      window.titlebar = false;

      input = {
        "type:keyboard" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:caps_toggle,caps:none,grp_led:scroll";
        };
      };

      output = {
        "DP-3" = {
          mode = "2560x1440@120Hz";
          scale = "1.0";
          position = "1920 0";
        };
        "HDMI-A-4" = {
          mode = "1920x1080@100Hz";
          scale = "1.0";
          position = "0 0";
        };
      };

      workspaceOutputAssign =
      (builtins.genList (i: {
        workspace = toString (i + 1);
        output = "DP-3";
      }) 10) ++
      (builtins.genList (i: {
        workspace = toString (i + 11);
        output = "HDMI-A-4";
      }) 10);

      bars = [];
    };
  };
}
