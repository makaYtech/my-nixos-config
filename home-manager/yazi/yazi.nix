{ pkgs, ... }: {
  programs.yazi = {
    settings = {
      yazi ={
        show_hidden = true;
        show_symlink = true;
      };
    };
  };
}