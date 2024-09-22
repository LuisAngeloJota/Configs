{ config, pkgs, ... }:
{
  programs.virt-manager.enable = true;

  users.users.la.extraGroups = [
    "libvirt"
  ];

  virtualisation.libvirtd.enable = true;
}
