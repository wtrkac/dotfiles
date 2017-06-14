""" vimrc basic
" 個人的で基本的な設定
"
" なんか参考の設定，kaoriyaバージョンはデフォルトで読むらしい
:source $VIMRUNTIME/vimrc_example.vim

" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
set tabstop=3
set shiftwidth=3
" 自動的にインデントする (noautoindent:インデントしない)
"set autoindent
" より高度なインデントらしい
set cindent
" 長い行を折り返さず表示 (wrap:折り返す)
set nowrap
"set wrap
" 行番号を表示 (nonumber:非表示)
set number
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" カーソルのある列をハイライトする
" 見慣れないとちょっとうっとおしいかも
"set cursorcolumn
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" タイトルを表示
set title

" アンドゥ履歴をファイルに保存する
set undofile
" バックアップファイルとかを作成するディレクトリ
" swapファイルをおくディレクトリを指定
set directory=$HOME/dotfiles/vim/tmp
" backupファイルをおくディレクトリを指定
set backupdir=$HOME/dotfiles/vim/backup
set undodir=$HOME/dotfiles/vim/undo

" 007などの数を<C-a>でインクリメントすると8進数と認識され，010になる
" これを抑制する
set nf=""

" matchに<>を追加
set matchpairs& matchpairs+=<:>
" デフォルトでは無効になっている高度なマッチ機能のmatchitを有効にする
:source $VIMRUNTIME/macros/matchit.vim
" .mdファイルをマークダウン言語と認識してもらう
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mark*} set filetype=markdown
" バッファーに開いているファイルに更新があったとき自動で読み込む
set autoread

