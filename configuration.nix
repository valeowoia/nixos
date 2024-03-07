# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "kaede";

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
    videoDrivers = [ "displaylink" "modesetting" ];
  };
  services.gvfs.enable = true;
  services.printing.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  security.rtkit.enable = true;
  services.blueman.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.valeowoia = {
    isNormalUser = true;
    description = "Valerie Sireneva";
    extraGroups = [ "networkmanager" "wheel" "vboxusers"];
    packages = with pkgs; [
      kate
    ];
  };


  
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "valeowoia" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsecure = true;

  environment.systemPackages = with pkgs; [
  nerdfonts
  pulseaudioFull
  vim
  unzip
  fastfetch
  vscode
  flameshot
  chromium
  telegram-desktop
  bitwarden
  spotify
  acpi
  wget
  pritunl-client
  obs-studio
  filezilla
  element-desktop
  ghidra
  git
  gradle
  obs-studio
  qrencode
  rocketchat-desktop
  anydesk
  dtc
  gparted
  kicad
  noto-fonts-color-emoji
  screen
  stlink
  wev
  yubikey-manager-qt
  yubikey-personalization-gui
  tmux
  minicom
  virtualbox
  steam
  jetbrains.webstorm
  ];

  system.stateVersion = "23.11";

}
