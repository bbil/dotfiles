default: all

scripts:
	stow -t $HOME -v scripts
tmux:
	stow -t $HOME -v tmux
git:
	stow -t $HOME -v git
nvim:
	stow -t $HOME -v nvim
kitty:
	stow -t $HOME -v kitty

all: scripts tmux git nvim kitty

