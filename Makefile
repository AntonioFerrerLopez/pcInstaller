
.PHONY:install
install: basic docker node symfony_cli slack vscode git_config change_to_zsh info_next_steps

	
.PHONY:basic
basic:
	@echo "Installing  BASIC PROGRAMS ...  "
	@sudo apt install grub-customizer snapd software-properties-common apt-transport-https ca-certificates gnupg wget lsb-release curl git  fzf tldr zsh exa -y

.PHONY:docker
docker:
	@echo "INSTALLING DOCKER"
	@sudo apt-get update
	@sudo apt install docker.io docker-compose -y
	@sudo usermod -aG docker $(USER)
	@sudo systemctl enable --now docker

.PHONY:node
node:
	@echo "INSTALLING NODE"
	@sudo apt install nodejs npm -y

.PHONY:symfony_cli
symfony_cli:
	@echo "INSTALLING SYMFONY Cli"
	@wget https://get.symfony.com/cli/installer -O - | bash
	@sudo mv ~/.symfony/bin/symfony /usr/local/bin/symfony || echo "INSTALLED GLOBALLY"

.PHONY:slack
slack:
	@echo "INSTALLING Slack"
	@sudo snap install slack --classic

.PHONY:oMyzshInstall
oMyzshInstall:
	@sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


.PHONY:dotlyInstall
dotlyInstall:
	sh -c "curl -s https://raw.githubusercontent.com/CodelyTV/dotly/HEAD/installer"

.PHONY:vscode
vscode:
	@echo "INSTALLING VSCODE"
	@sudo snap install code --classic

.PHONY:github_cli
github_cli:
	@echo "1- curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg"
	@echo '2- echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null'
	@echo "3- sudo apt update && sudo apt install gh "
	@echo "4- gh auth login"

.PHONY:git_config
	@echo "CONFIG GLOBALS GIT"
	@git git config --global user.name "Antonio Ferrer"
	@git git config --global user.email "buceocv@gmail.com"


.PHONY:change_to_zsh
change_to_zsh: 
	@echo "Changing Shell to ZSH for " $(USER)
	@chsh -s /usr/bin/zsh $(USER)

.PHONY:info_next_steps
info_next_steps:
	@echo "MANUAL INSTALATION REQUIRED: "
	@echo "OmyzSh : "
	@echo 'sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
	@echo "Dotly: "
	@echo 'bash <(wget -qO- https://raw.githubusercontent.com/CodelyTV/dotly/HEAD/installer)'
	@echo "Insert alias for vsCode (after install Dotly): "
	@echo "echo 'alias code=\"snap run code\"'  >> ~/.dotfiles/shell/aliases.sh"
	@echo "PLEASE DONT FORGET INSTALL FROM BROWSER : "
	@echo "- Intelij toolbox"
	@echo "- Google Chrome"
	@echo "- Github cli see:  make github_cli"
