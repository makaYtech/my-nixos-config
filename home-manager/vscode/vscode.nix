{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extansions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      mhutchie.git-graph
    ];

    userSettings = {
      "editor.tabSize" = 2;
    };
  };
}