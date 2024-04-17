{ config, pkgs, ... }:
{
  imports = [
    ./bundle.nix
    ./hardware-configuration.nix
  ];
  system.stateVersion = "23.11";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "mitigations=off"
  ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  console.useXkbConfig = true;

  environment.systemPackages = with pkgs; [
    anki-bin
    brave
    ffmpeg
    mpv-unwrapped
    obs-studio
    unzip
    ventoy
    wget
    yt-dlp
  ];

  fonts.packages = with pkgs; [
    font-awesome
    inter
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
  ];

  hardware.bluetooth.enable = true;
  hardware.cpu.intel.updateMicrocode = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  networking.firewall.enable = false;
  networking.hostName = "X571GT";
  networking.timeServers = [
    "time.cloudflare.com"
  ];
  networking.wireless.iwd.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.git.enable = true;
  programs.ssh.startAgent = true;

  security.sudo.wheelNeedsPassword = false;

  services.pipewire.alsa.enable = true;
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;
  services.printing.enable = true;
  services.thermald.enable = true;
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
  users.users.la.initialHashedPassword = "";

  zramSwap.enable = true;
}
