{ config, pkgs, ... }: {
  imports = [
    ./packages.nix
    ./sway/sway.nix
    ./zsh/zsh.nix
    ./waybar/waybar.nix
    ./alacritty/alacritty.nix
    ./wofi/wofi.nix
    ./enviroment_variables.nix
    ./theme/gtk.nix
    ./theme/qt.nix
    ./vscode/vscode.nix
    ./sway/librewolf.nix
  ];

  home = {
    username = "maka";
    homeDirectory = "/home/maka";
    stateVersion = "25.11";
  };
}
