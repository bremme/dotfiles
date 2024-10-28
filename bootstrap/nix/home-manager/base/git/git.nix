{lib, ...}: {
  programs.git = {
    enable = true;
    userName = "bremme";
    userEmail = "6715707+bremme@users.noreply.github.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      pull = {
        ff = "true";
      };
      push = {
        autoSetupRemote = "true";
      };
      # core = {
      #   hooksPath = "~/.git-template/hooks";
      # };
      include = {
        path = "~/.gitconfig-local";
      };
    };
  };
}
