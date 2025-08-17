eval "$(/opt/homebrew/bin/brew shellenv)"


#Alias
alias vim=nvim
alias cfg="nvim ~/.config"
alias src="source ~/.zshrc"
alias la="ls -la"

#Prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vsc_info:git:*' formats '%b%f %m%u%c %a'
zstyle ':vcs_info:*' check-for-changes true 
zstyle ':vcs_info:*' stagedstr ' +' 
zstyle ':vcs_info:*' unstagedstr ' !'

precmd() {
	vcs_info
	print -P "%~ ${vcs_info_msg_0_}"  
}
PROMPT='%B%(!.#.$)%b'
