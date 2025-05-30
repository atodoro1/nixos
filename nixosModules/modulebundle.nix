{ pkgs, lib, ... }: {

  imports = [
    ./battery.nix
  ];

  battery.enable =
    lib.mkDefault true;

}
