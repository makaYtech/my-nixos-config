{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    xdg-desktop-portal-wlr
    xdg-desktop-portal
    fastfetch
    btop
    alacritty
    mc
    sway
    swaybg
    waybar
    wofi
    mako
    polkit_gnome
    pcmanfm
    vscodium
    firefox
    nix-zsh-completions
    zsh-powerlevel10k
    cliphist
    wl-clipboard
    wl-clip-persist 
    grim
    slurp
  ];
}