{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bottles
    mangohud
  ];

  hardware.graphics.enable32Bit = true;

  programs.gamemode.enable = true;
  programs.gamescope.capSysNice = true;
  programs.gamescope.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
}
