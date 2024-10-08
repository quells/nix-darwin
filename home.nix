{ config, pkgs, ... }: {
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs._1password
    pkgs.ack
    pkgs.bat
    pkgs.btop
    pkgs.coreutils
    pkgs.darwin.trash
    pkgs.duckdb
    pkgs.ffmpeg
    pkgs.fzf
    pkgs.graphviz
    pkgs.jq
    pkgs.just
    pkgs.mosh
    pkgs.mtr
    pkgs.pv
    pkgs.ripgrep
    pkgs.starship
    pkgs.sqlite
    pkgs.tmux
    pkgs.unixtools.watch
    pkgs.wrk
    pkgs.xz
    pkgs.yt-dlp

    pkgs.vimPlugins.vim-nix

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".bc".source = dotfiles/bc;
    ".bin/FrontFinderWindowPath.scpt".source = dotfiles/FrontFinderWindowPath.scpt;
    ".tmux.conf".source = dotfiles/tmux.conf;
    ".vimrc".source = dotfiles/vimrc;

    ".config/fish/functions/cdf.fish".source = dotfiles/fish/functions/cdf.fish;
    ".config/fish/functions/f.fish".source = dotfiles/fish/functions/f.fish;
    ".config/fish/functions/fallback.fish".source = dotfiles/fish/functions/fallback.fish;
    ".config/fish/functions/halp.fish".source = dotfiles/fish/functions/halp.fish;
    ".config/fish/functions/lips.fish".source = dotfiles/fish/functions/lips.fish;
    ".config/fish/functions/timemachine.fish".source = dotfiles/fish/functions/timemachine.fish;
    ".config/fish/functions/warn.fish".source = dotfiles/fish/functions/warn.fish;

    ".config/starship.toml".source = dotfiles/starship.toml;

    "justfile".source = dotfiles/justfile;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      bc= "bc -lq";
      gpu = "git push -u origin (git branch --show-current)";
      start-ssh-agent = "eval (ssh-agent -c)";
    };
    interactiveShellInit = ''
      source (/etc/profiles/per-user/kwells/bin/starship init fish --print-full-init | psub)
      
      set fish_greeting # Disable greeting
      set -x BC_ENV_ARGS $HOME/.bc

      alias vim='/run/current-system/sw/bin/nvim'

      set -l SSH_AGENT_RUNNING (ps -e | grep ssh-agent | grep -v grep)
      if test -z "$SSH_AGENT_RUNNING"
          echo "starting ssh-agent"
          eval (ssh-agent -c) >/dev/null 2>/dev/null
      end
    '';
  };

  programs.git = {
    enable = true;
    userName = "Kai Wells";
    userEmail = "support@kaiwells.me";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
