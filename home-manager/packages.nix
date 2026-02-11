{ config, pkgs, lib, ... }:

let
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    sha256 = "1klgyhj98j3gfsql5sn9rapyx62qk5g8adk5zh9mnc4d0fj61gdr";
  }) { system = "x86_64-linux"; };
in
{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "vscode-extension-mhutchie-git-graph"
      # "rust-lang.rust-analyzer"
      "spotify"
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
      "obsidian"
    ];

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
    nix-zsh-completions
    zsh-powerlevel10k
    cliphist
    wl-clipboard
    wl-clip-persist 
    grim
    slurp
    throne
    telegram-desktop
    usbutils
    iptables
    usb-modeswitch
    steam
    p7zip
    unar
    winetricks
    librewolf
    obsidian
    iw
    lutris
    wine
    libreoffice
    gimp
    adwaita-qt
    adwaita-icon-theme
    yazi
    vesktop
    heroic
    proxychains
    fzf
    spotify
    unzip
    zip

    #development
    rustc
    rustPackages.rust-src
    cargo
    clippy
    rustfmt
  ] ++ [
    unstable.protonplus
    unstable.gamemode
    unstable.gamescope
  ];
}