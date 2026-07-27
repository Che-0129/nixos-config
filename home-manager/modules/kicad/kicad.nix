{ pkgs, ... }:
let
  kicad-libraries = pkgs.callPackage ./kicad-libraries.nix {};
in
{
    home = {
        packages = with pkgs; [
            kicad
            kicad-libraries
        ];
        file = {
            ".config/kicad/10.0/fp-lib-table".text = ''
                (fp_lib_table
                    (version 7)
                    (lib (name "KiCad") (type "Table") (uri "${pkgs.kicad.libraries.footprints}/share/kicad/template/fp-lib-table") (options "") (descr ""))
                    (lib (name "My footprints") (type "KiCad") (uri "${kicad-libraries}/footprints") (options "") (descr ""))
                )
            '';
            ".config/kicad/10.0/sym-lib-table".text = ''
                (sym_lib_table
                	(version 7)
                	(lib (name "KiCad") (type "Table") (uri "${pkgs.kicad.libraries.symbols}/share/kicad/template/sym-lib-table") (options "") (descr ""))
                	(lib (name "My symbols") (type "Table") (uri "${kicad-libraries}/sym-lib-table") (options "") (descr ""))
                )
            '';
        };
    };
}
