.zshrc
==

my zsh env

~/.zshenv
```shell:.zshenv
export ZDOTDIR=$HOME/zsh
```

tools
```command
$ brew install fzf
$ (brew --prefix)/opt/fzf/install

$ git clone git@github.com:b4b4r07/enhancd.git ~/zsh/

$ brew install ripgrep
$ brew install romkatv/powerlevel10k/powerlevel10k
$ brew install zsh-autosuggestions
```

ubuntu
```command
$ git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
$ mv ~/.fzf.zsh zsh/

$ sudo apt install zsh-autosuggestions
$ sudo apt install ripgrep
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

$ sudo mv ~/powerlevel10k /usr/local/opt
$ sudo ln -s /usr/share/zsh-autosuggestions /usr/local/share/

# docker install
$ sudo apt install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       gnupg-agent \
       software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo apt-key fingerprint 0EBFCD88
$ sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
$ sudo apt update
$ sudo apt install docker-ce docker-ce-cli containerd.io


# Nerd font install
$ git clone --depth=1 https://github.com/romkatv/nerd-fonts.git
$ cd nerd-fonts
$ sudo ./build 'Meslo/S/*'
$ ./install.sh SourceCodePro
```

terminal preferences-->font   select SauceCodePro Nerd Mono Regular
