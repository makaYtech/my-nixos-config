{ pkgs, ... }: {
  home.sessionVariables.QT_QPA_PLATFORMTHEME = "adwaita";

  xdg.configFile."qt5ct/qt5ct.conf".text = ''
    [Appearance]
    color_scheme_path=
    custom_palette=false
    icon_theme=Adwaita
    standard_dialogs=gtk
    style=adwaita-dark
  '';

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    color_scheme_path=
    custom_palette=false
    icon_theme=Adwaita
    standard_dialogs=gtk
    style=adwaita-dark
  '';
}