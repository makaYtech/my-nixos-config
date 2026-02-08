# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa         
      vulkan-loader
    ];
  };
  networking.firewall.allowedUDPPorts = [ 2080 ]; 
  programs.throne.tunMode.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub.device = "nodev";

  networking.hostName = "nixos";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
  virtualisation.libvirtd.enable = true;

  # if you use libvirtd on a desktop environment
  programs.virt-manager.enable = true;
  # Обязательно: включаем IP tables для nfqws
  networking.firewall.enable = true;
  boot.kernelModules = [ "nfnetlink_queue" ];
  # services.udev.extraRules = ''
  #   ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="c811", ATTR{power/control}="on"
  # '';
  # boot.blacklistedKernelModules = [ 
  #   "rtw88_8821cu"
  #   "rtw88_usb"
  #   "rtw88_core" 
  # ];
  # boot.extraModprobeConfig = ''
  #   options rtw88_8821cu disable_watchdog=1 debug=0
  # '';

  # Set your time zone.
  time.timeZone = "Asia/Yekaterinburg";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono];
  security.polkit.enable = true;
  programs.sway.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.zsh.enable = true;
  users.users.maka = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "input" "networkmanager" "libvirtd" ];
    packages = with pkgs; [
      tree
   ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    home-manager
    nerd-fonts.jetbrains-mono
    git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}

