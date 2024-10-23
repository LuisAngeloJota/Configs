{ config, pkgs, ...}:
{
  imports = [
    ./appimage.nix
    ./gaming.nix
    ./idevice-tools.nix
    #./lanzaboote.nix
    ./sway.nix
    ./thunar.nix
    ./uxplay.nix
    ./virt-manager.nix
  ];
}
