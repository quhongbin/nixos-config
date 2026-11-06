{ pkgsUnstable, ...}:
{
  home.packages = with pkgsUnstable; [
    antigravity-cli
  ];
}
