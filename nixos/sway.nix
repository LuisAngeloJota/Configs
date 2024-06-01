{ config, pkgs, ... }:
{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.sway.enable = true;
  programs.sway.extraOptions = [
    "--unsupported-gpu"
  ];
  programs.sway.extraPackages = with pkgs; [
    brightnessctl
    foot fuzzel
    glib gnome.adwaita-icon-theme grim
    libnotify
    mako
    playerctl
    slurp swaybg swayidle swaylock
    tesseract
    wl-clipboard wl-screenrec
  ];
  programs.sway.wrapperFeatures.gtk = true;
  programs.thunar.enable = true;

  services.gvfs.enable = true;

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];
}
