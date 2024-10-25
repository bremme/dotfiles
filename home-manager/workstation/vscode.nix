{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    nixd
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # python
      ms-python.python
      ms-python.vscode-pylance
      ms-python.debugpy
      ms-python.black-formatter

      # nix
      # bbenoist.nix
      jnoortheen.nix-ide
      kamadorueda.alejandra

      yzhang.markdown-all-in-one
      DavidAnson.vscode-markdownlint
      redhat.vscode-yaml
      tamasfe.even-better-toml
      redhat.vscode-xml
      timonwong.shellcheck

      streetsidesoftware.code-spell-checker
      # streetsidesoftware.code-spell-checker-dutch
      tomoki1207.pdf
      github.copilot
      github.copilot-chat
      christian-kohler.path-intellisense

      zhuangtongfa.material-theme
    ];
  };
}
