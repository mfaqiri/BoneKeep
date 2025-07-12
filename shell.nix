{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [libgit2];
}
