{ config, pkgs, ... }:
{
  system.stateVersion = "23.11";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "f2fs" "vfat" ];

  console.useXkbConfig = true;

  environment.systemPackages = with pkgs; [
    git
  ];

  hardware.enableRedistributableFirmware = true;

  networking.wireless.iwd.enable = true;

  services.getty.autologinUser = "root";
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "colemak_dh";

  users.users.root.initialHashedPassword = "";
}
