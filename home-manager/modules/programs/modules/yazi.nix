{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      open = {
        rules = [
          { mime = "video/*"; use = "vlc"; }
          { mime = "audio/*"; use = "vlc"; }
        ];
      };
      opener = {
        vlc = [
          {
            run = "vlc --one-instance --started-from-file %s";
            orphan = true;
            for = "unix";
          }
        ];
      };
    };
  };
}
