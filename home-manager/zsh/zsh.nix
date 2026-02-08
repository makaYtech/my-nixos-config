{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      rebuildHM = "home-manager switch";
      flakeHome = "home-manager switch --flake ~/my-nixos-config/#maka";
      flakeNix = "sudo nixos-rebuild switch --flake ~/my-nixos-config/#nixos";
    };
    plugins = [
      {
        name = "zsh-autocomplete"; # completes history, commands, etc.
        src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "762afacbf227ecd173e899d10a28a478b4c84a3f";
          sha256 = "1357hygrjwj5vd4cjdvxzrx967f1d2dbqm2rskbz5z1q6jri1hm3";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };

    initContent = ''
      clear
      fastfetch
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
  };
}