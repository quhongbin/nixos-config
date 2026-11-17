{ pkgsUnstable, ...}:
{
  home.packages = with pkgsUnstable; [
    cc-switch
  ];
}
