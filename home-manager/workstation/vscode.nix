{ lib, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python 
      ms-python.vscode-pylance
      ms-python.debugpy
      ms-python.black-formatter

      # bbenoist.nix
      jnoortheen.nix-ide
      yzhang.markdown-all-in-one
      redhat.vscode-yaml
      tamasfe.even-better-toml
      redhat.vscode-xml
      timonwong.shellcheck

      streetsidesoftware.code-spell-checker
      # streetsidesoftware.code-spell-checker-dutch
      tomoki1207.pdf
      github.copilot
      github.copilot-chat

      zhuangtongfa.material-theme
    ];
  };
}