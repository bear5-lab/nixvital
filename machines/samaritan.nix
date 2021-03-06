{ config, pkgs, ... }:

{
  imports = [
    ./base
    ../nix-home/breakds
    ../modules/users
    ../modules/desktop
    ../modules/IoT/apple-devices.nix
    ../modules/steam.nix
    ../modules/vm.nix
    ../modules/dev/python-environment.nix
    ../modules/dev/java.nix
    ../modules/binary-caches/gilgamesh.nix
  ];

  vital.machineType = "desktop";

  # Machine-specific networking configuration.
  networking.hostName = "samaritan";
  # Generated via `head -c 8 /etc/machine-id`
  networking.hostId = "9c4a63a8";

  # +----------+
  # | Desktop  |
  # +----------+

  vital.desktop = {
    enable = true;
    xserver.displayManager = "gdm";
    xserver.dpi = 100;
    nvidia = {
      enable = true;
    };
  };

  # +------------+
  # | WakeOnLan  |
  # +------------+

  # services.wakeonlan.interfaces = [{
  #   interface = "eno1";
  # }];

  # +------------+
  # | Gaming     |
  # +------------+

  # Support Logitech G29 Steering Wheel
  services.udev.packages = with pkgs; [
    usb-modeswitch-data
  ];

  # +-------------+
  # | Development |
  # +-------------+

  vital.dev.python = {
    batteries = {
      machineLearning = true;
    };
  };

  environment.systemPackages = with pkgs; [
    darktable axel gimp
  ];
}
