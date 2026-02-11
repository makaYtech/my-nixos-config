{ pkgs, ... }: {
  programs.yazi = {
    enable = true;
    settings = {
      manager ={
        show_hidden = true;
        show_symlink = true;
      };
      opener = {
        edit = [
          {
            run = "codium %*";
            for = "unix";
          }
        ];
      };
      open = {
        prepend_rules = [
          {
            url = "*.nix";
            use = "edit";
          }
        ];
      };
    };
  };
}