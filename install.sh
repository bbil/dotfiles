echo "Copy i3 configs"
mkdir ~/.config/.i3 && cp -vb ~/dotfiles/i3/* ~/.config/.i3/
 
echo "Copy Xdefaults"
cp -vb ~/dotfiles/xorg/.Xdefaults ~/.Xdefaults

echo "DONE!"
echo "Things to do:"
echo "\tRestart i3 -- or just logout and log back in"
echo "\tManually move things from .profile over"