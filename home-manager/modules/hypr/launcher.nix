{
  services.hyprlauncher = {
    enable = true;
    settings = {
      general.show_apps_on_open = true;
      ui.window_size = "600 400";
    };
  };
  xdg.desktopEntries = {
    "nvim" = {
      name = "Neovim";
      noDisplay = true;
    };
    "yazi" = {
      name = "Yazi File Manager";
      noDisplay = true;
    };
  };
}
