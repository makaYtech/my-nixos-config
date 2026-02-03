{ config, pkgs, ... }: {
  imports = [
    ./home-manager/packages.nix
    ./home-manager/sway/sway.nix
    ./home-manager/zsh/zsh.nix
    ./home-manager/waybar/waybar.nix
    ./home-manager/alacritty/alacritty.nix
    ./home-manager/wofi/wofi.nix
    ./home-manager/enviroment_variables.nix
    ./home-manager/theme/gtk.nix
    ./home-manager/theme/qt.nix
  ];

  home = {
    username = "maka";
    homeDirectory = "/home/maka";
    stateVersion = "25.11";
  };
}
