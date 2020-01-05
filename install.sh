echo "Copy i3 configs"
mkdir ~/.config/.i3 && cp -vb ~/dotfiles/i3/* ~/.config/.i3/
 
echo "Copy Xdefaults"
cp -vb ~/dotfiles/xorg/.Xdefaults ~/.Xdefaults

echo "copying scripts"
cp -r ~/dotfiles/.scripts/ ~

echo "copy bspwmrc"
mkdir ~/.config/bspwm && cp -vb ~/dotfiles/bspwm/bspwmrc ~/.config/bspwm/

echo "copy sxhkdrc"
mkdir ~/.config/sxhkd && cp -vb ~/dotfiles/sxhkd/sxhkdrc ~/.confgi/sxhkd/

echo "DONE!"
echo "Things to do:"

echo "\tRestart i3 -- or just logout and log back in"
echo "\tManually move things from .profile over"
