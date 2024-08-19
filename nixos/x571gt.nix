{ config, pkgs, ... }:
{
  # Base
  imports = [
    ./bundle.nix
    ./hardware-configuration.nix
  ];
  system.stateVersion = "24.11";

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  boot.kernelParams = [
    "mitigations=off"
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 200;
    "vm.page-cluster" = 0;
  };

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  console.useXkbConfig = true;

  fonts.fontconfig.defaultFonts.sansSerif = [
    "Inter"
  ];
  fonts.fontconfig.defaultFonts.serif = [
    "Noto Serif"
  ];
  fonts.fontconfig.defaultFonts.monospace = [
    "JetBrains Mono"
  ];
  fonts.packages = with pkgs; [
    material-symbols
    inter
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

  hardware.bluetooth.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime.intelBusId = "PCI:0:2:0";
  hardware.nvidia.prime.nvidiaBusId = "PCI:1:0:0";
  hardware.nvidia.prime.offload.enable = true;
  hardware.nvidia.prime.offload.enableOffloadCmd = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  networking.firewall.enable = false;
  networking.hostName = "X571GT";
  networking.nameservers = [
    "127.0.0.1"
    "::1"
  ];
  networking.timeServers = [
    "time.cloudflare.com"
  ];
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    DriverQuirks = {
      PowerSaveDisable = "rtw_8821ce";
    };
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.auto-optimise-store = true;

  powerManagement.cpuFreqGovernor = "performance";

  programs.nix-ld.enable = true;

  security.rtkit.enable = true;

  services.nextdns.arguments = [
    "-config"
    "a96f8b"
  ];
  services.nextdns.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.enable = true;
  services.pipewire.jack.enable = true;
  services.pipewire.pulse.enable = true;
  services.power-profiles-daemon.enable = true;
  services.printing.enable = true;
  services.xserver.videoDrivers = [
    "nvidia"
  ];
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "colemak_dh";

  time.timeZone = "Asia/Manila";

  users.users.la.extraGroups = [
    "wheel"
  ];
  users.users.la.isNormalUser = true;
  users.users.la.initialPassword = "la";

  zramSwap.enable = true;

  # Applications
  environment.systemPackages = with pkgs; [
    anki aria2 audacious
    btop
    chromium
    ffmpeg firefox
    git
    handbrake
    imagemagick
    libarchive libreoffice-fresh localsend
    mediainfo mpv
    obs-studio
    protonup-qt
    rsync
    shotcut streamlink streamrip
    ventoy
    wireguard-tools
    qpwgraph
    yt-dlp
  ];

  # Appimages
  programs.appimage.binfmt = true;
  programs.appimage.enable = true;

  # Gaming
  environment.systemPackages = with pkgs; [
    bottles
    mangohud
  ];

  hardware.graphics.enable32Bit = true;

  programs.gamemode.enable = true;
  programs.steam.enable = true;

  # iDevice Tools
  environment.systemPackages = with pkgs; [
    idevicerestore
    ifuse
    libimobiledevice
  ];

  services.usbmuxd.enable = true;

  # Sway
  environment.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    NIXOS_OZONE_WL = "1";
    WLR_RENDERER = "vulkan";
  };

  programs.sway.enable = true;
  programs.sway.extraOptions = [
    "--unsupported-gpu"
  ];
  programs.sway.extraPackages = with pkgs; [
    brightnessctl
    foot fuzzel
    glib adwaita-icon-theme grim
    libnotify
    mako
    playerctl
    slurp swaybg swayidle swaylock
    tesseract
    vulkan-validation-layers
    wl-clipboard
    yambar
  ];
  programs.sway.wrapperFeatures.gtk = true;

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];

  # Thunar
  programs.thunar.enable = true;

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
        if (subject.isInGroup("wheel") && action.id == "org.freedesktop.udisks2.filesystem-mount-system")
            return polkit.Result.YES;
    });
  '';

  services.gvfs.enable = true;
  services.tumbler.enable = true;

  # Uxplay
  environment.systemPackages = with pkgs; [
    uxplay
  ];

  services.avahi.enable = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;

  # Virt Manager
  programs.virt-manager.enable = true;

  users.users.la.extraGroups = [
    "libvirtd"
  ];

  virtualisation.libvirtd.enable = true;
}
