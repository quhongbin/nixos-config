{pkgsUnstable,config,...}:

{
  programs.codex = {
    package = pkgsUnstable.codex;
    enable = true;
  };
}
