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
    yambar
  ];
  programs.sway.wrapperFeatures.gtk = true;

  services.greetd.enable = true;
  services.greetd.settings = {
    default_session = {
      command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
    };
  };

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
}
