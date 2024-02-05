{ pkgs, inputs, ... }:
{
  # List packages installed in system profile.
  environment.systemPackages =
  [ pkgs.curl
    pkgs.git
    pkgs.iterm2
    pkgs.vim
    pkgs.vscode
    pkgs.wget
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Configure shells
  programs.zsh.enable = true;
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  users.users.kwells = {
    name = "kwells";
    home = "/Users/kwells";
  };
}
