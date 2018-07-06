" quickrun settings {{{
" プラグインとして
" "thinca/vim-quickrun"
" はもちろんのこと，
" "Shougo/unite.vim"
" "osyo-manga/shabadou.vim"
" "osyo-manga/unite-quickfix"
" が入っていることが前提の設定っぽい
" デフォルト設定をなくすかどうか たぶんどっちでも同じこと
"let g:quickrun_config = {}
"unlet! g:quickrun#default_config
"
" ファイル毎にどのような処理をするかの設定
" ただし，"_"はすべての状況を表す
let g:quickrun_config = {
\	"_": {
\     "hook/close_unite_quickfix/enable_hook_loaded" : 1,
\     "hook/unite_quickfix/enable_failure" : 1,
\     "hook/close_quickfix/enable_exit" : 1,
\     "hook/close_buffer/enable_failure" : 1,
\     "hook/close_buffer/enable_empty_data" : 1,
\     "outputter" : "multi:buffer:quickfix",
\     "outputter/buffer/vsplit" : ":botright 8sp",
\		"outputter/buffer/into": 0,
\		"outputter/quickfix/into": 0,
\     "runner" : "vimproc",
\     "runner/vimproc/updatetime" : 40,
\	},
\	"c": {
\		"cmdopt" : " -std=gnu99"
\	},
\	'gnuplot': {
\		"type"   : "gnuplot",
\		"command": "gnuplot",
\		"exec"   : "%c %o %a %s",
\	},
\}
" ウィンドウを右側に出すようにする
set splitright
" 実行を停止するとか
nnoremap <expr><silent> <C-C> quickrun#is_running() ?  quickrun#sweep_sessions() : "\<C-c>"
" プログラムに引数を渡したいときにつかう
map \R :<C-u>QuickRun -args<SPACE>
" 時間を計測してくれるらしい
"let g:quickrun_config = {'_': {'hook/time/enable': '1'},}
" }}}

