{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "atodoro1";
  home.homeDirectory = "/home/atodoro1";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

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
    brave
    slack
    discord
    file
    obsidian
    jq
    vscode
    nmap
    wireshark
    tcpdump
    termshark
    kubeshark
    burpsuite
    minikube
    kubectl
    awscli2
    home-manager
    neofetch
    zip
    unzip
    dnsutils
    ltrace
    lsof
    zoom-us
    gcc
    man-pages
    man-pages-posix
    kitty
    oniux
    signal-desktop
    citrix_workspace
    sticky-notes
    python3
    pulseaudio
    tor-browser
    v4l-utils
    ffmpeg
    arp-scan
    youtube-music
    caligula
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  # or
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  # or
  #  /etc/profiles/per-user/atodoro1/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.git = {
    enable = true;
    userName = "Angel Todorov";
    userEmail = "2angel.todorov@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      l = "ls -aF";
      ll = "ls -l";
      ls = "ls --color=tty";
      vi-home = "sudo vi /etc/nixos/hosts/hp/home.nix";
      vi-conf = "sudo vi /etc/nixos/hosts/hp/configuration.nix";
      update = "sudo nixos-rebuild switch --flake \"/etc/nixos#nixos\"";
      k = "kubectl";
    };
    history = {
      size = 10000;
      path = "/home/atodoro1/.zsh_history";
    };
    initContent = ''
      bindkey '^[[1;5D' backward-word
      bindkey '^[[1;5C' forward-word
      bindkey '^H' backward-kill-word
      bindkey '^[[3;5~' kill-word
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[∴](bold green)";
        error_symbol = "[∴](bold red)";
      };
    };
  };

programs.vim = {
  enable = true;
  defaultEditor = true;
  extraConfig = ''
    syntax on
    set number
    set nocompatible
    filetype plugin indent on
    set tabstop=4
    set shiftwidth=4
    set smarttab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType nix setlocal ts=2 sts=2 sw=2 expandtab
    set colorcolumn=80
    set textwidth=80
    command! Col   set colorcolumn=80
    command! Nocol set colorcolumn=
  '';
};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
