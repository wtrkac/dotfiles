"################################################################################
" プラグインマネージャの"dein"のための記述
" プラグインの情報はTOMLファイルなるものに書くとよいらしい
" ~/.vim/dein/ 以下にTOMLファイルを用意することにする
" git が必要
" **現状，call dein#update()を実行するとエラーがでるため，使用を中止**
"
" deinの置く場所
let s:dein_dir = expand('~/.vim/dein')
" deinのリポジトリがある場所?
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
	set nocompatible
endif

" dein.vimがない場合自動インストール
if !isdirectory(s:dein_repo_dir)
	echo "installing dein.vim ..."
	execute 'git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

" pathの設定?
execute 'set runtimepath^=' . s:dein_repo_dir
"set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

"--------------------------------------------------------------------------------
"Start dein.vim Settings.
"--------------------------------------------------------------------------------
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

"	let s:toml = s:dein_dir . '/.dein.toml'
"	let s:lazy_toml = s:dein_dir . '/.dein_lazy.toml'
"	call dein#load_toml(s:toml, {'lazy': 0})
"	call dein#load_toml(s:lazy_toml, {'lazy': 1})
"
	call dein#add('Shougo/dein.vim')
	call dein#end()
	call dein#save_state()
endif
" プラグインの追加，削除tomlファイルの設定を変更した場合は
" 適宜，call dein#updateやcall dein#clear_stateが必要らしい

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on

" pluginのための設定
"nmap <C-q><C-q> :<C-u>QuickRun -args("")<LEFT><LEFT>
map \R :<C-u>QuickRun -args<SPACE>
" 上のマップは端末によっては聞かないことがあるらしい

"let g:quickrun_config = get(g:, 'quickrun_config', {})
"let g:quickrun_config._ = {
"      \ 'runner'    : 'vimproc',
"      \ 'runner/vimproc/updatetime' : 60,
"      \ 'outputter' : 'error',
"      \ 'outputter/error/success' : 'buffer',
"      \ 'outputter/error/error'   : 'quickfix',
"      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
"      \ 'outputter/buffer/close_on_empty' : 1,
"      \ }


"################################################################################


