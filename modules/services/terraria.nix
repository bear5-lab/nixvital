{ config, pkgs, lib, ... }:

{
  services.terraria = {
    port = (import ../../data/resources.nix).ports.terraria;
    autoCreatedWorldSize = "medium";
    messageOfTheDay = "Welcome to the Farm.";
  };
}