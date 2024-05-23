# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix-desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nftables.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = ",dvp";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.uzen = {
    isNormalUser = true;
    description = "uzen";
    extraGroups = [ "networkmanager" "wheel" "docker" "adbusers"];
    packages = with pkgs; [
      firefox
      neovim
      steam
      signal-desktop
      teamspeak_client
      nextcloud-client
      alacritty
      typst
      gh
      starship
      carla
      calf
      ardour
      ripgrep
      valgrind
      appimage-run
      feishin
      # libsForQt5.bismuth
      libsForQt5.polonium
      pkgs.jetbrains-toolbox
      corectrl
      mpv
      vlc
      helvum
      steam-run # cursed
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    python3
    vim
    git
    tailscale
    neofetch
    btop
    gcc
    fish
    gnumake
    zip
    unzip
    xclip
    wl-clipboard
    nodejs
    kdeconnect
    # for neovim lsps
    clang-tools
    typst-lsp
    pyright
    # jdt-language-server
    # texlab
    gopls
    avahi
    easyeffects
    uxplay
    pulseaudio	# for alvr to run pactl
    aha
    fwupd
    linuxKernel.packages.linux_6_6.xpadneo
    sunshine
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
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Enable tailscale
  services.tailscale.enable = true;
  services.tailscale.useRoutingFeatures = "client";
  services.resolved.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
  ];

  # Steam settings
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  hardware.opengl.driSupport32Bit = true;

  # Fcitx5
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-rime
      rime-data
    ];
  };
  # services.xserver.desktopManager.runXdgAutostartIfNone = true;

  # IBus
  # i18n.inputMethod = {
  #   enabled = "ibus";
  #   ibus.engines = with pkgs.ibus-engines; [
  #     mozc
  #     libpinyin
  #     rime
  #   ];
  # };

  services.flatpak.enable = false;
  programs.kdeconnect.enable = true;

  # for feishin
  nixpkgs.config.permittedInsecurePackages = [
                "electron-24.8.6"
              ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  virtualisation.docker.enable = true;

  # Some stuff for dynamic things
  # programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = with pkgs; [
  #   # Add any missing dynamic libraries for unpackaged programs
  #   # here, NOT in environment.systemPackages
  # ];

  boot.supportedFilesystems = [ "ntfs" ];

  # Corectrl
  programs.corectrl.enable = true;
  programs.corectrl.gpuOverclock.enable = true;

  # avahi
  services.avahi = {
  enable = true;
  nssmdns = true;  # printing
  publish = {
    enable = true;
    addresses = true;
    workstation = true;
    userServices = true;
    };
  };

  # easyeffects
  programs.dconf.enable = true;
  # services.easyeffects.enable = true;

  nix.gc.automatic = true;
  nix.gc.dates = "03:15";

  # sidequest
  programs.adb.enable = true;

  services.fwupd.enable = true;

  # nix-ld
  programs.nix-ld.enable = true;

  # for simula?
  nix.trustedUsers = ["root" "uzen"];
  
  # sunshine
  security.wrappers.sunshine = {
        owner = "root";
        group = "root";
        capabilities = "cap_sys_admin+p";
        source = "${pkgs.sunshine}/bin/sunshine";
 };
}
