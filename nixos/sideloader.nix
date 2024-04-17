{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    harfbuzz
    libadwaita
    libimobiledevice
    libplist
  ];
  
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    harfbuzz
    libadwaita
    libimobiledevice
    libplist
  ];

  services.usbmuxd.enable = true;
}
