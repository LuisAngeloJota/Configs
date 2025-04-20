{ config, pkgs, ... }:
{
  imports = [
    ./bundle.nix
    ./hardware-configuration.nix
  ];
  system.stateVersion = "25.05";

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [
    "mitigations=off"
  ];

  boot.kernel.sysctl = {
    "net.ipv4.tcp_congestion_control" = "bbr";
    "vm.swappiness" = 200;
    "vm.page-cluster" = 0;
  };

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  console.useXkbConfig = true;

  environment.systemPackages = with pkgs; [
    anki aria2 audacious
    brave btop
    ffmpeg firefox
    git
    handbrake
    imagemagick
    libarchive libreoffice-fresh localsend
    mediainfo mpv
    niv
    obs-studio
    pandoc protonup-qt pwvucontrol
    rsync
    sbctl shotcut streamlink streamrip
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
    "JetBrains Mono NL"
  ];
  fonts.packages = with pkgs; [
    font-awesome
    inter
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = true;
  hardware.nvidia.prime.intelBusId = "PCI:0:2:0";
  hardware.nvidia.prime.nvidiaBusId = "PCI:1:0:0";
  hardware.nvidia.prime.offload.enable = true;
  hardware.nvidia.prime.offload.enableOffloadCmd = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
    vpl-gpu-rt
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [
    "wlan0"
  ];
  networking.hostName = "X571GT";
  networking.nameservers = [
    "194.242.2.4#base.dns.mullvad.net"
  ];
  networking.timeServers = [
    "time.cloudflare.com"
  ];
  networking.useDHCP = false;
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    DriverQuirks = {
      PowerSaveDisable = "rtw_8821ce";
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.logind.lidSwitch = "ignore";
  services.logind.powerKey = "ignore";
  services.pipewire.alsa.enable = true;
  services.pipewire.enable = true;
  services.pipewire.jack.enable = true;
  services.pipewire.pulse.enable = true;
  services.power-profiles-daemon.enable = true;
  services.printing.enable = true;
  services.resolved.dnsovertls = "true";
  services.resolved.dnssec = "true";
  services.resolved.domains = [
    "~."
  ];
  services.resolved.enable = true;
  services.resolved.fallbackDns = [
    "194.242.2.4#base.dns.mullvad.net"
  ];
  services.xserver.videoDrivers = [
    "nvidia"
  ];

  systemd.network.enable = true;
  systemd.network.networks."50-wlan" = {
    matchConfig.Name = "wlan0";
    networkConfig.DHCP = "yes";
    networkConfig.IgnoreCarrierLoss = "3s";
  };

  time.timeZone = "Asia/Manila";

  users.users.la.extraGroups = [
    "wheel"
  ];
  users.users.la.isNormalUser = true;
  users.users.la.initialPassword = "la";

  zramSwap.enable = true;
}
