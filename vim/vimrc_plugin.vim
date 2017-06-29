""" vimrc plugin

" プラグイン関係をここに記述する

"################################################################################
" deinによるプラグイン管理
" neobundleのニューバージョン的存在らしい
" 現在エラーが発生するためneobundleで同じことをやっている
":source ~/.vim/vimrc_dein.vim
"
"################################################################################
" neobunbleによるプラグイン管理
if has('vim_starting')
	set nocompatible
	" neobundleがない場合gitコマンドを用いてインストールする
	if !isdirectory(expand("~/dotfiles/vim/bundle/neobundle.vim/"))
		:call system("git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vim/bundle/neobundle.vim")
	endif
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/vim/bundle'))
let g:neobundle_default_git_protocol='https'
NeoBundleFetch 'Shougo/neobundle.vim'
" 以下にインストールしたいプラグインを列挙していけばよい

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/neomru.vim"
NeoBundle "Shougo/neosnippet.vim"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'Shougo/neocomplcache.vim'
""NeoBundleLazy 'thinca/vim-quickrun', {
""  \ 'autoload' : {
""  \   'mappings' : [['n', '\r']],
""  \   'commands' : ['QuickRun']
""  \ }}
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle "osyo-manga/unite-quickfix"
"
NeoBundle "easymotion/vim-easymotion"
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'nanotech/jellybeans.vim'
"
"################################################################################
" プラグインの列挙はここまで
"################################################################################

NeoBundleCheck
call neobundle#end()
filetype plugin indent on
syntax on


"################################################################################
" プラグインの設定
"################################################################################

source ~/dotfiles/vim/vimrc_plugin_config_neocomplcache.vim
source ~/dotfiles/vim/vimrc_plugin_config_neosnippet.vim
source ~/dotfiles/vim/vimrc_plugin_config_unite.vim
source ~/dotfiles/vim/vimrc_plugin_config_quickrun.vim
"
"" ~~~.texファイルをlatexのファイルと認識する?
"let g:tex_flavor='latex'


"" vim-indent-guides {{{
" CUIではあまり美しくないように見えるので使うのを止める
" -> t_Co = 256とするとちょっといい感じになったのでやっぱり使ってみる
" Vim起動時にvim-indent-guidesも起動
let g:indent_guides_enable_on_vim_startup=1
" ガイドするレベル
let g:indent_guides_start_level=2
" 自動での色付けを停止，奇数列と偶数列で色をかえるため
let g:indent_guides_auto_colors=0
" 奇数列の色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=darkgray
" 偶数列の色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=blue
" ターミナルの背景とかで見栄えの良さが変わるので
" :so $VIMRUNTIME/syntax/colortest.vim を参考にして設定すると良いかも
" ハイライトする色の変化の幅
let g:indent_guides_color_change_percent = 30
" 色付けする文字数
let g:indent_guides_guide_size = 3
"}}}
"
" vim-airlineの設定 {{{
" タブラインにもairlineを使用する
let g:airline#extensions#tabline#enabled = 1
" タブが一個の場合はタブラインを非表示
let g:airline#extensions#tabline#show_buffers = 0
" 0でそのタブで開いているウィンドウの数，1でそのタブの番号?左から連番
let g:airline#extensions#tabline#tab_nr_type = 1
" }}}

