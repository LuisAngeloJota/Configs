{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  users.users.la.extraGroups = [
    "vboxusers"
  ];

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
