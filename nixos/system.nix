{ pkgs, ... }:
{
  networking.hostName = "wsl";
  time.timeZone = "Europe/Stockholm";

  # Allow unfree packages.
  # nixpkgs.config.allowUnfree = true;

  seb = {
    # User config.
    sid = "s8525c";
    name = "Jonas Eana";
    # Customize username (defaults to SID).
    # username = "jo";

    wsl.enable = true;

    # Location of home/user specific configuration.
    home = ./home.nix;

    # Enable YubiKey support.
    # yubikey.enable = true;
  };

  wsl = {
    tarball.configPath = ./.;

    # Include windows paths inside WSL (slows down your completion/PATH lookup).
    # interop.includePath = true;

    # Enable USB support.
    # usbip = {
    #   enable = true;
    #   autoAttach = ["3-1" "4-1"];
    # };
  };

  # Use fish as your default shell.
  # programs.fish.enable = true;
  # users.defaultUserShell = pkgs.fish;

  # Use nushell as your default shell.
  # users.defaultUserShell = pkgs.nushell;

  # Use zsh as your default shell.
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Install system-wide packages.
  #
  # Search for packages here: https://search.nixos.org/packages
  environment.systemPackages = [
    pkgs.lsof
    # ...
  ];

  system.stateVersion = "23.05";
}
