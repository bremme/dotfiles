{ lib, ... }:

{
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      # settings = {
      #   # Add a new line before the start of the prompt.
      #   add_newline = false;  
      
      #   username = {
      #     style_user = "white bold";
      #     style_root = "red bold";
      #     format = "[$user]($style)";
      #     disabled = false;
      #     show_always = true;
      #   };

      #   hostname = {
      #     ssh_only = false;
      #     format =  "@[$hostname](bold red) in ";
      #     trim_at = ".companyname.com";
      #     disabled = false;
      #   };

      # };
    };
    home.file = {
      ".config/starship.toml".source = ./starship.toml;
    };
}