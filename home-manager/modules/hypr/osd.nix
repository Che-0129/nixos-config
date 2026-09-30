{ inputs, ... }: {
  imports = [ inputs.hyprosd.homeManagerModules.default ];
  services.hyprosd.enable = true;
}
