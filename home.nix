{ config, pkgs, ... }: {
  imports = [
    ./home-manager/packages.nix
    ./home-manager/sway/keybinds.nix
    ./home-manager/sway/sway.nix
    ./home-manager/zsh/zsh.nix
    ./home-manager/waybar/waybar.nix
    ./home-manager/alacritty/alacritty.nix
    ./home-manager/wofi/wofi.nix
    ./home-manager/enviroment_variables.nix
    ./home-manager/theme/gtk.nix
    ./home-manager/theme/qt.nix
    ./home-manager/vscode/vscode.nix
    ./home-manager/yazi/yazi.nix
  ];

  home = {
    username = "maka";
    homeDirectory = "/home/maka";
    stateVersion = "25.11";
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Adwaita-dark";
        icon-theme = "Adwaita";
        cursor-theme = "Adwaita";
        font-name = "JetBrainsMono Nerd Font 10";
      };
      "org/gnome/desktop/wm/preferences" = {
        theme = "Adwaita";
      };
    };
  };
  xdg.configFile."gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name=Adwaita
    gtk-icon-theme-name=Adwaita
    gtk-application-prefer-dark-theme=1
    gtk-font-name=JetBrainsMono Nerd Font 10
  '';
  programs.git = {
    enable = true;
    settings.user = {
      name = "makaYtech";
      email = "mmaka9322@gmail.com";
    };
  };
}
