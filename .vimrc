
" runtimepathが何者かよくわからん
" ^=~という書き方が何を表すのかがよくわからん
"if has('vim_starting')
"	set runtimepath^=~/.vim
"endif

" augroup名をリセット
augroup myvimrc
	autocmd!
augroup END

" 保存時に行末スペースを取り除くことを自動実行
autocmd myvimrc BufWritePre * %s/\s\+$//e

" 基本的な設定
:source $HOME/dotfiles/vim/vimrc_basic.vim
" プラグインの設定
:source $HOME/dotfiles/vim/vimrc_plugin.vim
" 自分で定義した関数
:source $HOME/dotfiles/vim/vimrc_function.vim
" 自分で定義したキーマップ（プラグイン関係は除く）
:source $HOME/dotfiles/vim/vimrc_mapping.vim

"################################################################################
" color関係
" これを設定しないと色の種類が8種類しかないとかになったりする
set t_Co=256
" colorschemeが対応していれば（明るめ/暗め）背景用のものに切り替わる
set background=light
"set background=dark
" colorschemeはプラグインで導入した後に記述しないと，ファイルが見つからないなど言われる
"colorscheme jellybeans
colorscheme desert
"colorscheme ron


"---------------------------------------------------------------------------
