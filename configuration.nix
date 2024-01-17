{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    evdi
  ];
  boot.initrd.luks.devices."luks-bdf625e6-c015-45cc-8c43-4d78d2124567".device = "/dev/disk/by-uuid/bdf625e6-c015-45cc-8c43-4d78d2124567";
  networking.hostName = "harumi";

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
  sound.enable = true;
  
  services = {
    xserver = {
      layout = "us";
      xkbVariant = "";
      videoDrivers = [ "displaylink" "modesetting" ];
      enable = true;
      windowManager.i3 = {
        enable = true;
    };
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+i3";
    };
  };
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      pulseaudio = true;
    };
  };

  users.users.valeowoia = {
    isNormalUser = true;
    description = "User Name";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
  kitty
  dmenu
  git
  gnome.gnome-keyring
  nerdfonts
  networkmanagerapplet
  pulseaudioFull
  rofi
  vim
  unzip
  fastfetch
  polybarFull
  vscode
  rofi
  flameshot
  chromium
  telegram-desktop
  i3-rounded
  i3lock-fancy
  i3lock-color
  xss-lock
  lxappearance
  gnome.nautilus
  feh
  xorg.xev
  bitwarden
  picom-next
  spotify
  spicetify-cli
  acpi
  brightnessctl
  ];

  programs = {
    thunar.enable = true;
    dconf.enable = true;
  };


  hardware = {
    bluetooth.enable = true;
  };

  system.stateVersion = "23.11";

}
