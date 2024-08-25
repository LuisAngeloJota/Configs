{ config, pkgs, ...}:
{
  imports = [
    ./appimage.nix
    ./gaming.nix
    ./idevice-tools.nix
    ./sway.nix
    ./thunar.nix
    ./uxplay.nix
    ./virt-manager.nix
  ];
}
