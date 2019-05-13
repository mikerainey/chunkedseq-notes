
# Pin that sucker for reproducibility:
with (import (fetchTarball "https://github.com/NixOS/nixpkgs-channels/archive/nixos-18.03.tar.gz") {});
# Use whatever the user makes default:
# with (import <nixpkgs> {});  
let orgEmacs = emacsWithPackages (with emacsPackagesNg; [org]);
in stdenv.mkDerivation {
  name = "docsEnv";
  buildInputs = [ # orgEmacs
                  # haskellPackages.lhs2tex
                  # biber
                  (texlive.combine {
                    inherit (texlive)
                      totpages
                      environ
                      trimspaces
#                      manyfoot
                      comment
                      mathpartir
                      stmaryrd
                      cleveref
                      enumitem
                      # Below here may be extras [2018.07.11].  Overkill.
                      lm
                      todonotes
                      latexmk
                      libertine
                      ntheorem
                      # stmaryrd lazylist polytable # for lhs2tex
                      xargs
                      biblatex
                      logreq
                      makecell
                      adjustbox
                      collectbox
                      # The 'balance' is part of this preprint bundle.
                      preprint
                      mnsymbol lipsum multirow
                      scheme-small wrapfig marvosym wasysym wasy cm-super unicode-math filehook lm-math capt-of
                      xstring ucharcat cmll;
                  })
                ];
}
