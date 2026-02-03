{ config, pkgs, ... }:

{
  xdg.configFile."wofi/style.css".text = ''
    * {
      font-family: "JetBrainsMono Nerd Font", "FontAwesome", "Roboto", sans-serif;
      font-size: 16px;
      color: #ebdbb2;
      border-radius: 15px;
    }

    window {
      background-color: rgba(20, 20, 20, 0.85);
      margin: 5px;
      border: 2px solid #3c3836;
    }

    #input {
      padding: 8px 12px;
      margin: 8px;
      background-color: rgba(30, 30, 30, 0.9);
      border-radius: 10px;
    }

    #entry {
      padding: 8px 12px;
      margin: 4px 8px;
      border-radius: 8px;
    }

    #entry:selected {
      background-color: rgba(180, 140, 0, 0.8);
      color: #282828;
    }

    #scroll {
      padding: 4px;
    }
  '';
}