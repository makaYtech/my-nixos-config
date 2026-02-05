{ pkgs, lib, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        mhutchie.git-graph
        jnoortheen.nix-ide
      ];
    

      userSettings = {
        "editor.tabSize" = 2;
      };
    };
  };
}