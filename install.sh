#!/bin/sh
dir="$(cd "$(dirname "$0")" && pwd)"

link() {
	src="$dir/$1"
	dest="$2"
	mkdir -p "$(dirname "$dest")"
	# keep a backup if a real (non-symlink) file is in the way
	if [ -e "$dest" ] && [ ! -L "$dest" ]; then
		mv "$dest" "$dest.bak"
		echo "Made backup $dest -> $dest.bak"
	fi
	ln -sfn "$src" "$dest"
}

link zsh/.zshrc      "$HOME/.zshrc"
link zsh/.zprofile   "$HOME/.zprofile"
link tmux/.tmux.conf "$HOME/.tmux.conf"
link nvim            "$HOME/.config/nvim"
link emacs 	     "$HOME/.config/emacs"
link lektra          "$HOME/.config/lektra"
link sway/config     "$HOME/.config/sway/config"
link kitty/kitty.conf "$HOME/.config/kitty/kitty.conf"
