{ lib, ... }:

{
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;  # Add a new line before the start of the prompt.
      };
    };
}