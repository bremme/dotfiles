{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./git/git.nix
    ./starship/starship.nix
  ];

  home.packages = with pkgs; [
    fd
    eza
    wget
    curl
    jq
    yq
    bat
    unzip
    gnutar
    htop
  ];

  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          # "git"
        ];
        # theme = "robbyrussell";
        custom = "$HOME/dotfiles/dotfiles/oh-my-zsh";
      };
      autosuggestion = {
        enable = true;
      };
      syntaxHighlighting = {
        enable = true;
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = ["--cmd" "cd"];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    fastfetch = {
      enable = true;
    };
  };
}
