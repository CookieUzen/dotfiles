#!/bin/bash

# FO/Folder Opener
folderName=$1
if [ -z "$folderName" ]
then
	read folderName
fi

echo accessing folder/file $folderName...

case $folderName in
	fo)
		nvim ~/.fo.sh;;

	vf)
		cd ~/vf;;
	
	coding)
		cd ~/vf/Coding;;

	s)
		cd ~/vf/s/;;
	
	nvim)
		cd ~/.config/nvim/;;

	Nvim)
		nvim ~/.config/nvim;;
	
	brc)
		nvim ~/.bashrc;;
	
	Brc)
		source ~/.bashrc;;
	
	tmux)
		nvim ~/.tmux.conf;;
	
	class)
		cd ~/vf/Class;;
	asa)
		cd ~/vf/Class/ASA;;
    pp)
		cd ~/vf/Personal\ Project/;;

    config)
        cd ~/.config/;;
	
    mun)
        cd ~/vf/MUN/;;

	*)
		echo Error, this folder/file does not exsist, to add $folderNameto this script, edit ~/.fo.sh.
esac
