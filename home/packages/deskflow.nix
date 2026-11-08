{ pkgsUnstable, ...}:
{
	home.packages = with pkgsUnstable; [
    deskflow
  ];
}
