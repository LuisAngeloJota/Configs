{ config, pkgs, ... }:
{
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
    ventoy vscode-fhs
    wireguard-tools
    qpwgraph
    yt-dlp
  ];

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
}
