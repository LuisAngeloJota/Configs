{ config, pkgs, ... }:
{
  programs.sway.enable = true;
  programs.sway.extraPackages = with pkgs; [
    brightnessctl
    foot fuzzel
    grim
    playerctl
    slurp swaybg swayidle swaylock
    thunar
    waybar wl-clipboard
  ];
  programs.sway.wrapperFeatures.gtk = true;
  programs.thunar.enable = true;
}
