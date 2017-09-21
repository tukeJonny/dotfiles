# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export MAUDE_LIB=/usr/local/maude
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export M2_HOME=/usr/local/apache-maven-3.3.9
export PATH=/opt/local/bin:/opt/local/sbin/:$M2_HOME:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:/Users/ne250143/.rbenv/versions/2.1.6/bin/
export MANPATH=/opt/local/man:$MANPATH
export WORKON_HOME=$HOME/.virtualenvs
export CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include -I/usr/local/include -I/usr/local/Cellar/readline/6.3.8/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib -L/usr/local/lib -L/usr/local/Cellar/readline/6.3.8/lib"
source /usr/local/bin/virtualenvwrapper.sh
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export GOPATH=/Users/ne250143/Documents/Go
export PATH=$PATH:$GOPATH/bin
eval "$(pyenv init -)"

setopt auto_cd
function chpwd() { ls }
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# set aliases of some applications.
alias firefox="open -a Firefox\ 2"
alias prev="open -a Preview"
alias hping="sudo hping3"
alias composer="php /usr/local/bin/composer.phar"
alias volatility="/usr/local/Cellar/volatility/2.5/bin/vol.py"
alias beef="cd -q /Users/ne250143/github/beef; ./beef -x; cd -q /Users/ne250143"
alias h2i="/Users/ne250143/gocode/bin/h2i"
alias recon-ng="/usr/local/ctftools/LaNMaSteR53-recon-ng-d23da13f2b6d/recon-ng"
alias urlcrazy="/usr/local/ctftools/urlcrazy-0.5/urlcrazy"
alias harvester="/usr/local/ctftools/theHarvester/theHarvester.py"
alias diff="diff -ybBw"
alias adb="/Applications/Genymotion.app//Contents/MacOS/tools/adb"
alias zipcomment="unzip -lz"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I"
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc"
alias torcurl="curl --socks5 localhost:9050"

function working_socks() {
	echo "[*] Staring SOCKS Proxy on localhost:1080 ...";
	ssh -fN -D 1080 working && echo "[+] Success."
}

function kill_working_socks() {
	PID=`pgrep -f 'ssh -fN -D'`
	IDENT=`ps auxww | grep "${PID}[ ]"`
	echo "[!] We will kill below process."
	echo "$IDENT"
	echo -n "Are you sure [y/n]: " && read choice
	case "$choice" in
		y)
			kill -KILL "$PID";
			;;
		n)
			echo "OK.";
			;;
		*)
			echo "Error.";
	esac
}

function gitsuborigin() {
	local domain=$1 && shift
	echo "domain = ${domain}"
	git remote add origin git@github.com.sub:$domain
}

function gitfil() {
	local fname=$1 && shift
	local command=$1
	git filter-branch --tree-filter "find . -name \'${fname}\' -exec ${command} {} \;"
}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Print a random, hopefully interesting, adoge.
if (($+commands[fortune] )); then
	fortune -a
	print
fi

#色設定
autoload -U colors; colors

# もしかして機能
setopt correct

# PCRE 互換の正規表現を使う
setopt re_match_pcre

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプト指定
PROMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "

# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '

# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "


#補完候補をハイライト
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2


#補完候補をオプションやディレクトリで分けて表示
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

#オプションを補完する時の表示を分かりやすくする
# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

#色を付ける
# 名前で色を付けるようにする
autoload colors
colors

# LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


function openport {

	for port in `netstat -an | grep LISTEN | awk '{print $4}' | perl -pe 's/127\.0\.0\.1//g' | perl -pe 's/\*?\.(\d+)$/\1/g' | perl -pe 's/://g'`; do
		perl -e 'print "-"x15';
		echo "\n";
		sudo lsof -i :"${port}";
	done
}

function youtubedl {
	local url=$1
	local fname=$(echo "$url" | shasum | perl -pe 's/([a-z0-9]+).+/\1/')
	local dst=/Volume/TOSHIBA_HDD2
	youtube-dl -o $dst/$fname $url
	ffmpeg -i $dst/$fname.mkv -vcodec copy $dst/$fname.mp4
	rm -rf $dst/$fname.mkv
	terminal-notifier -message "Finish download youtube movie!"
}


#ググれカスコマンド導入
function web_search {
  local url=$1       && shift
  local delimiter=$1 && shift
  local prefix=$1    && shift
  local query

  while [ -n "$1" ]; do
    if [ -n "$query" ]; then
      query="${query}${delimiter}${prefix}$1"
    else
      query="${prefix}$1"
    fi
    shift
  done

  open "${url}${query}"
}

function sssh {
	local hostname=$1
	ssh "senshuSSH/$hostname"
}

function systrace {
	local pid=$1 && shift
	local syscall=$1
	local proc_name=`ps aux | grep "${pid}" | head -n 1  | awk '{print $11}'`
	echo "process is ${proc_name}"
	if [ -z "${pid}" ]; then
		echo "Usage: systrace <pid> <syscall name>?"
		return;
	fi
	if [ -z "${syscall}" ]; then
		syscall="*"
		echo "tracing all syscall"
	else
		echo "tracing syscall ${syscall}"
	fi
	sudo dtrace -n "syscall::${syscall}:entry / pid == ${pid} / { trace(pid) }" 2> /dev/null
}

function ggrks () {
  web_search "https://www.google.co.jp/search?&q=" "+" "" $*
}

#Tukejonny作成　ランダムIPアドレス生成 引数に個数を与えられる
function randomIP() {
repeat $1 do;
for i in {1..4}; do;
((RAN=$RANDOM%1000))
((RAN=$RAN%256))
echo -n $RAN.
done;
printf "\n";
done | sed s/.$// | cat
}


# Print a random, hopefully interesting, adoge.
if (($+commands[fortune] )); then
	fortune -a
	print
fi

#色設定
autoload -U colors; colors

# もしかして機能
setopt correct

# PCRE 互換の正規表現を使う
setopt re_match_pcre

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst


# プロンプト指定(コマンドの続き)
OMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "
PROMPT2='[%n]> '

# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "


#補完候補をハイライト
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2


#補完候補をオプションやディレクトリで分けて表示
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete zstyle :cozsh: command not found: #

#cd 補完
# 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd
export PATH="/usr/local/sbin:$PATH"
export PATH=/Users/ne250143/.cargo/bin:$PATH
