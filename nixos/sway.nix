{ config, pkgs, ... }:
{
  environment.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    NIXOS_OZONE_WL = "1";
  };
  programs.sway.enable = true;
  programs.sway.extraOptions = [
    "--unsupported-gpu"
  ];
  programs.sway.extraPackages = with pkgs; [
    brightnessctl
    foot fuzzel
    grim
    playerctl
    slurp swaybg swayidle swaylock
    tesseract
    wl-clipboard
  ];
  programs.sway.wrapperFeatures.gtk = true;
  programs.thunar.enable = true;
}
