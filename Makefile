.PHONY: downstream upstream deploy vim bash bin plugins debian arch install git cornell
MSG=small edit (submodules updated, probably)
REPO=dotfiles
HR="-----------------------------------------------------------------------------------"
DEBIAN=vim git ruby ocaml texlive clang emacs24 vim nasm astyle tofrodos source-highlight gdb lldb doxygen doxygen-doc graphviz ddd git g++ python-gpgme gobjc gnustep gnustep-make gnustep-common libgnustep-base-dev evince pandoc hollywood
# for now, same as debian. AUR installs via `yaourt` not included.
ARCH=${DEBIAN}

# update plugins from source repos...
downstream:
	@echo "BUNDLE UPDATE\n${HR}"
	git submodule update --init --recursive

upstream: downstream
	git add -A
	git commit -m "${MSG}"
	git push

install: plugins deploy

deploy: downstream vim bash git
	@echo "\nDEPLOY\n${HR}"
	@echo "dotfiles installed successfully."
	@echo "\nrun 'make bin' to deploy binaries (requires root privileges!)"
	@echo "run 'make debian' or 'make arch' to install packages (requires root privileges!)"

vim: downstream
	@echo "\nVIM\n${HR}"
	@echo "deploying vim directory..."
	/bin/cp -ur vim ~/.vim
	@echo "vim directory installed."
	@echo "deploying vim configuration..."
	/bin/cp vimrc ~/.vimrc
	@echo ".vimrc installed. SPAWN A NEW TERMINAL INSTANCE TO SEE CHANGES."

bash: downstream
	@echo "\nBASH\n${HR}"
	@echo "deploying bash configuration..."
	/bin/cp bashrc ~/.bashrc
	. ~/.bashrc # source
	@echo ".bashrc installed."

git: downstream
	@echo "\nGIT\n${HR}"
	@echo "deploying git configuration..."
	/bin/cp gitconfig ~/.gitconfig
	@echo ".gitconfig installed."

bin: downstream 
	@echo "\nBINARIES\n${HR}"
	@echo "deploying the following binaries:"
	@ls bin/
	@echo "\n"
	sudo chmod a+x bin/*
	sudo /bin/cp bin/* /usr/local/bin
	@echo "binaries installed."

plugins:
	@echo "PLUGINS\n${HR}"
	git rm --cached vim -r | true
	/bin/rm -rf ./vim/
	mkdir -p ./vim/autoload ./vim/bundle && \
	 curl -LSso ./vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	git submodule add --force https://github.com/scrooloose/nerdtree.git ./vim/bundle/nerdtree
	git submodule add --force --depth=1 https://github.com/rust-lang/rust.vim.git ./vim/bundle/rust.vim
	git submodule add --force https://github.com/vim-scripts/cool.vim ./vim/bundle/cool.vim
	git submodule add --force https://github.com/luochen1990/rainbow.git ./vim/bundle/rainbow
	git submodule add --force https://github.com/scrooloose/nerdcommenter ./vim/bundle/nerdcommenter
	git submodule add --force https://github.com/airblade/vim-gitgutter ./vim/bundle/vim-gitgutter

cornell:
	sudo apt-get install nodejs npm
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	nvm install node
	npm install -g cornell

debian: downstream
	@echo "\nPACKAGES (DEBIAN)\n${HR}"
	sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && \
		sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean
	sudo apt-get install ${DEBIAN}

arch: downstream
	@echo "\nPACKAGES (ARCH)\n${HR}"
	sudo pacman -Syu
	sudo pacman -S ${ARCH}

${REPO}.zip:
	@echo "ZIP\n${HR}"
	git archive --format=zip HEAD -o ${REPO}.zip -9v

${REPO}.tar.gz:
	@echo "TAR.GZ\n${HR}"
	git archive --format=tar.gz HEAD -o ${REPO}.tar.gz -9v
