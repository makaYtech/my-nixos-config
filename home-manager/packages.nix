{ config, pkgs, lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "vscode-extension-mhutchie-git-graph"
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
    firefox
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
    # spotify
    steam
    p7zip
    librewolf
    obsidian
    iw
    lutris
    wine
    libreoffice
    gimp
    adwaita-qt
    adwaita-icon-theme
  ];
}