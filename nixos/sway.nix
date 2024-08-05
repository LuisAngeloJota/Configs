{ config, pkgs, ... }:
{
  environment.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    NIXOS_OZONE_WL = "1";
    WLR_RENDERER = "vulkan";
  };

  programs.sway.enable = true;
  programs.sway.extraOptions = [
    "--unsupported-gpu"
  ];
  programs.sway.extraPackages = with pkgs; [
    brightnessctl
    foot fuzzel
    glib adwaita-icon-theme grim
    libnotify
    mako
    playerctl
    slurp swaybg swayidle swaylock
    tesseract
    vulkan-validation-layers
    wl-clipboard
  ];
  programs.sway.wrapperFeatures.gtk = true;

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];
}
