{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bottles-unwrapped
    mangohud
  ];

  hardware.graphics.enable32Bit = true;

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
}
