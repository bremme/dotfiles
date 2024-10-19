{ lib, ... }:

{
  imports = [
    ./starship/starship.nix
  ];

  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ 
          # "git" 
        ];
        theme = "robbyrussell";
        custom = "$HOME/dotfiles/dotfiles/oh-my-zsh";
      };
      autosuggestion = {
        enable = true;
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd" "cd" ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    }

  };
}