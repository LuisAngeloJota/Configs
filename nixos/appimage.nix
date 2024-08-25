{ config, pkgs, ... }:
{
  programs.appimage.binfmt = true;
  programs.appimage.enable = true;
}
