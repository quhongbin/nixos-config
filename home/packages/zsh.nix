# zsh 及其语法高亮。
{ pkgs,config, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
    defaultKeymap = "emacs";

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
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
