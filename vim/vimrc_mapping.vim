""" vimrc mapping
" 自分のキーマップについて
" ただし，プラグイン関連のマッピングはプラグインの方で記述する
"
" Key mappingの設定
"
" insert mode時の<C-j>を<ESC>に設定
inoremap <C-j> <ESC>
" insert mode時にjjを<ESC>に設定
inoremap jj <ESC>

" 次のタブへの移動を簡単に
" gtで:tabnext, gTで:tabprevがデフォルトである
nnoremap <C-n> :tabnext <CR>
nnoremap <C-p> :tabprev <CR>
" あんまり必要ないかも

" <ESC>二回でハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" すぐにvimrcをかけるようにマップしておく
nnoremap <F3> :<C-u>source ~/.vimrc <CR>
nnoremap <F4> :<C-u>tabedit ~/.vimrc <CR>

" Quickfixウィンドウの開閉のショートカット
nnoremap <F5>       :<C-u>call OpenCloseQuickfix() <CR>
inoremap <F5> <ESC> :<C-u>call OpenCloseQuickfix() <CR>

" 自作のQuickResultウィンドウの開閉のショートカット
nnoremap <C-F5>       :<C-u>call OpenCloseQuickResult("any") <CR>
inoremap <C-F5> <ESC> :<C-u>call OpenCloseQuickResult("any") <CR>

" 新しいタブで今いるディレクトリのMakefileを開く
noremap <F6> :<C-u>tabnew ./Makefile <CR>

" makeをキーマップ
nnoremap <F8>       :<C-u>write <CR> :make <CR>
"nnoremap <F8>       :<C-u>write <CR> :make %:r <CR>
inoremap <F8> <ESC> :<C-u>write <CR> :make <CR>
" make runのショーカット
nnoremap <C-F8>       :<C-u>make run
inoremap <C-F8> <ESC> :<C-u>make run

" 簡単にプログラムを実行するためのキーマップ
nnoremap <F9>       :call Execute() <CR>
inoremap <F9> <ESC> :call Execute()<LEFT>
	" この場合":Execute(aa bb)"などと実行してみて，aaという変数はないと叱られた
	" vimの変数のように入力しなくてはならないのか?
	" Execute("aa", "bb")などと入力したらうまく動いたっぽい
	" 入力が手間なので以下の自作コマンドを利用する
" 自作コマンドの引数をExecute()への引数として渡す
	" Exeが実行ファイルだと思ってスペースで区切って引数をかく
command! -nargs=* TempleteExe call Execute(<f-args>)
nnoremap <C-F9>       :TempleteExe<SPACE>
inoremap <C-F9> <ESC> :TempleteExe<SPACE>


" ノーマルモードでC-o, C-oで現在時刻を挿入
" 現在不具合発生中
"nmap <C-o> <C-o> <ESC> I<C-r>=strftime("#	%Y.%m.%d %H:%M:%S [] wataru_k<CR><ESC>F]")

" 挿入モードでカッコやクォートを入れたときに自動で閉じて
" カーソルをカッコの次に移動してくれるようにする
" ちょっと使い勝手がよくないかも？
"inoremap {} {}<LEFT>
"inoremap [] []<LEFT>
"inoremap () ()<LEFT>
"inoremap "" ""<LEFT>
"inoremap '' ''<LEFT>
"inoremap `` ``<LEFT>
"
