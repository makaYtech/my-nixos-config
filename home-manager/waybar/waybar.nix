{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "custom/nix" "sway/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "sway/language" "pulseaudio" "network" "tray" ];
        "sway/window" = { max-length = 40; };
        "tray" = { "spacing" = 10; };
        "custom/nix" = {
          "format" = " ";
          "tolltip" = "false";
          "on-click" = "wofi --allow-images --show drun --columns 3 -";
        };
        "network" = { 
          "format" = "{icon} {signalStrength}%";
          "format-disconnected" = "󰤭 ";
          "format-icons" = [ "󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 " ];
          "tooltip-format" = "{ipaddr} via {essid}";
        };
        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁";
          "format-icons" = {
            "default" = [ "󰕿" "󰖀" "󰕾" ];
            "css-module" = true;
          };
          "on-click" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "on-scroll-up" = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "on-scroll-down" = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
        };
        clock = { format = "{:%H:%M}";};
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", monospace;
        font-size: 16px;
        color: @color;
        background-color: @background;
      }

      @define-color background-hover rgba(70, 78, 96, 0.95);
      @define-color background-active rgba(70, 78, 96, 0.95);
      @define-color background-inactive rgba(70, 78, 96, 0.85);
      @define-color background rgba(46, 52, 64, 0.5);
      @define-color color #ebdbb2;

      #pulseaudio,
      #network,
      #tray,
      #language {
        margin-right: 10px;
        padding: 5px;
      }

      #custom-nix {
        font-weight: bold;
        font-size: 21px;
        padding-left: 8px;
        background-color: @background;
        color: #ebdbb2;
        min-width: 40px;
        transition: all 0.1s ease;
      }

      #custom-nix:hover {
        font-size: 25px;
        background-color: @background-hover;
      }

      #workspaces {
        background-color: transparent;
        color: #d8dee9;
      }

      #workspaces button {
        min-width: 20px;
        background-color: transparent;
        color: #ebdbb2;
        border: none;
        border-radius: 0;
        transition: all 0.1s ease;
      }

      #workspaces button.active,
      #workspaces button.focused,
      #workspaces button.active.focused {
        background-color: #458588;
        color: #1d2021;
        border-radius: 0;
        box-shadow: none;
      }

      #workspaces button.urgent {
        background-color: #b5413f;
        border-radius: 0;
      }

      #workspaces button label {
        background-color: transparent;
        padding: 0;
        margin: 0;
        font-size: 15px;
      }

      #workspaces button label:hover {
        background-color: transparent;
        padding: 0;
        margin: 0;
        font-size: 20px;
        color: black;
      }

      /* ========== Clock ========== */
      #clock {
        background-color: @background;
        transition: all 0.1s ease;
        padding: 5px;
        font-size: 20px;
        font-weight: bold;
      }

      #clock:hover {
        background-color: @background-hover;
      }

      /* ========== Playerctl ========== */
      #custom-playerctl {
        background-color: rgba(46, 52, 64, 0.85);
        padding: 5px;
        margin-right: 10px;
        transition: all 0.1s ease;
      }

      #custom-playerctl:hover {
        background-color: @background-hover;
        animation: pulse 2s infinite;
      }

      /* ========== Language ========== */
      #language {
        background-color: @background;
        padding: 5px;
        transition: all 0.1s ease;
      }

      #language:hover {
        background-color: @background-hover;
      }

      /* ========== Tray ========== */
      #tray > widget {
        background-color: @background;
        margin-right: 10px;
        transition: all 0.1s ease;
      }

      #tray > widget:hover {
        background-color: @background-hover;
      }

      #tray > widget > .passive {
        -gtk-icon-effect: dim;
      }

      /* ========== Audio/Network ========== */
      #pulseaudio,
      #network {
        transition: all 0.2s ease;
      }

      #pulseaudio:active {
        animation: pulse-animation 0.4s;
        background-color: rgba(255, 152, 0, 0.2);
      }

      #pulseaudio:hover,
      #network:hover {
        background-color: rgba(70, 78, 96, 0.95);
      }

      /* ========== Animations ========== */
      @keyframes pulse {
        0%   { opacity: 1; }
        100% { opacity: 1; }
        50%  { opacity: 0.7; }
      }

      @keyframes pulse-animation {
        0%   { background-color: rgba(255, 152, 0, 0.2); }
        100% { background-color: rgba(255, 152, 0, 0.2); }
        50%  { background-color: rgba(255, 152, 0, 0.4); }
      }
    '';
  };
}
