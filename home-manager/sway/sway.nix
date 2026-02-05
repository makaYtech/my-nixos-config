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

      keybindings = {
        "Mod4+q" = "exec ${pkgs.alacritty}/bin/alacritty";
        "Mod4+r" = "exec ${pkgs.wofi}/bin/wofi --allow-images --show drun --columns 3 -s ~/.config/wofi/style.css";
        "Mod4+c" = "kill";
        "Mod4+Tab" = "exec alacritty -e btop";
        "Mod4+Shift+c" = "reload";
        "Mod4+Shift+e" = "exec swaymsg exit";
        "Mod4+Shift+m" = "exec ${pkgs.pcmanfm}/bin/pcmanfm";
        "Mod4+p" = "exec ${pkgs.vscodium}/bin/codium";
        "Mod4+b" = "exec ${pkgs.librewolf}/bin/librewolf";
        "Mod4+v" = "exec cliphist list | wofi --dmenu --allow-images | cliphist decode | wl-copy";
        "Mod4+Shift+Print" = "exec slurp | grim -g - - | wl-copy";

        #workspaces
        "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+6" = "workspace number 6";
        "Mod4+7" = "workspace number 7";
        "Mod4+8" = "workspace number 8";
        "Mod4+9" = "workspace number 9";
        "Mod4+0" = "workspace number 10";

        "Mod4+Control+1" = "workspace number 11";
        "Mod4+Control+2" = "workspace number 12";
        "Mod4+Control+3" = "workspace number 13";
        "Mod4+Control+4" = "workspace number 14";
        "Mod4+Control+5" = "workspace number 15";
        "Mod4+Control+6" = "workspace number 16";
        "Mod4+Control+7" = "workspace number 17";
        "Mod4+Control+8" = "workspace number 18";
        "Mod4+Control+9" = "workspace number 19";
        "Mod4+Control+0" = "workspace number 20";

        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
        "Mod4+Shift+6" = "move container to workspace number 6";
        "Mod4+Shift+7" = "move container to workspace number 7";
        "Mod4+Shift+8" = "move container to workspace number 8";
        "Mod4+Shift+9" = "move container to workspace number 9";
        "Mod4+Shift+0" = "move container to workspace number 10";

        "Mod4+Shift+Control+1" = "move container to workspace number 11";
        "Mod4+Shift+Control+2" = "move container to workspace number 12";
        "Mod4+Shift+Control+3" = "move container to workspace number 13";
        "Mod4+Shift+Control+4" = "move container to workspace number 14";
        "Mod4+Shift+Control+5" = "move container to workspace number 15";
        "Mod4+Shift+Control+6" = "move container to workspace number 16";
        "Mod4+Shift+Control+7" = "move container to workspace number 17";
        "Mod4+Shift+Control+8" = "move container to workspace number 18";
        "Mod4+Shift+Control+9" = "move container to workspace number 19";
        "Mod4+Shift+Control+0" = "move container to workspace number 20";
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
