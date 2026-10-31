# zsh 及其语法高亮。
{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;

		plugins = [
			{
			name = "zsh-powerlevel10k";
			src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
			file = "powerlevel10k.zsh-theme";	
			}
		];
	initContent = ''
		[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
	'';
  };
}
