{ pkgs, config, ... }:
{
	programs.emacs ={
		enable = true;
	};
  home.activation.cloneEmacsConfig = ''
    EMACS_DIR="$HOME/.emacs.d"
    REPO_URL="git@github.com:quhongbin/MyEmacs.git"
    SSH_KEY="${config.home.homeDirectory}/.ssh/id_rsa"

    # 核心修复：配置 SSH 强制非交互式运行
    export GIT_SSH_COMMAND="${pkgs.openssh}/bin/ssh -i $SSH_KEY -o IdentitiesOnly=yes -o StrictHostKeyChecking=accept-new -o UserKnownHostsFile=/dev/null -o BatchMode=yes"

    if [ ! -d "$EMACS_DIR" ]; then
      echo "正在克隆 Emacs 配置仓库到 $EMACS_DIR ..."
      ${pkgs.git}/bin/git clone "$REPO_URL" "$EMACS_DIR"
    else
      echo "检测到 $EMACS_DIR 已存在，跳过克隆。"
    fi
  '';
}
