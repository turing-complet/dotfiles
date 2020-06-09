.PHONY: misc
misc:
	sudo cp viman /usr/bin/viman
	sudo chmod +x /usr/bin/viman
	./install.fish

.PHONY: update-plugins
update-plugins: init
	vim -c ':PlugInstall'
	vim -c ':Tmuxline zenburn'

.PHONY: init
init:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


