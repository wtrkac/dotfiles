""" vimrc funcsion
" vimrcの関数の定義部分をここに書く

" copenを簡単に開くための関数
let s:quickfixwindow = "close"
" function! b:openCloseQuickfix()
" 関数の名前が大文字かs:から始まっていないとダメみたい
" s:でもダメでした
function! OpenCloseQuickfix()
	if "open" ==? s:quickfixwindow
		let s:quickfixwindow = "close"
		cclose
	else
		let s:quickfixwindow = "open"
		copen
	endif
endfunction

"
" 編集中のファイルに対応したプログラムの実行を，拡張子をみて適当に行う
" QuickRunの劣化坂みたいなかんじ
" 要点
" 	1.	ファイルの拡張子からそのファイルが何の言語でかかれたスクリプトであるか判別し
" 		適切な実行(~~.shなら./~~.sh，~~.gpiならgnuplot ~~.gpiとするなど)をワンタッチで行うこと
" 	2. 実行の際に引数を与えて実行できる
"     TempleteExe [args ...]
"     というかんじ. <F9>あたりにマップしているはず
" 	3.	実行結果を変数s:ResultFileで指定したファイルに保存する
"     call OpenCloseQuickResult()
" 	   <F6>にキーマップして簡単に開閉できるようにしている
"     *このウィンドウを開いたまま<F9>をすると，ファイル内容が更新されたために，
"     *警告がでるかも．set autoread をしておくとよいっぽい
"
" s:OutputWindowを開いたり閉じたりする
let s:ResultFile = "Result.out"
"let s:TmpResultFile = s:ResultFile
" 実行結果を出力するファイル名をここで決めている
" 以下の関数OpenCloseQuickResultと関数Executeで共有されている
let s:QuickResultWindow = "close"
function! OpenCloseQuickResult(Order)
	" a:Orderの値があるべきs:QuickResultWindowの値というかんじ
	if a:Order ==? s:QuickResultWindow
		" なにもしない
		" あるべき状態にいるということ
	else
		" Orderで指定された状態と今の状態が異なるときの動作
		" s:QuickResultWindowはopenかcloseのどちらかのはず
		" 一方で，a:Orderはそのどちらでもないことがある. そのときも以下の動作をする
		if "open" ==? s:QuickResultWindow
			"silent execute ":bdelete! ". s:TmpResultFile
			silent execute ":bdelete! ". s:ResultFile
			let s:QuickResultWindow = "close"
		else
			"setlocal wrap
			"silent execute ":vsp " . s:TmpResultFile
			silent execute ":vsp " . s:ResultFile
			"setlocal nowrap
			let s:QuickResultWindow = "open"
			wincmd p
		endif
	endif
endfunction

function! Execute(...)
	write
	let s:extention = expand("%:e")
"	if &filetype == "sh" " これでもよいが拡張子を確認する方が柔軟かも
	if "sh" ==? s:extention
		let l:cmd  = expand("%:p") . " " . join(a:000)
			" 実行した時刻を記録
			let l:time = strftime("%Y_%H:%M")
			let l:firstline = "[" . l:time . "] " . l:cmd
			silent execute ":!echo " . l:firstline . " > " . s:ResultFile
			silent execute ":read!" . l:cmd .       " &>> " . s:ResultFile
			" 結果のファイルを表示する
			call OpenCloseQuickResult("open")
"	elseif &filetype == "gpi" || &filetype == "plt"
	elseif "gpi" ==? s:extention || "plt" ==? s:extention
		silent execute ":!gnuplot " . join(a:000) . " %"
		"	redraw!
	else
		"echo "No match: filetype = \"" . s:extention ."\""
		let l:cmd = 'echo "No match: filetype = [" s:extention"]"'
		":!make run
		" !がないとEnterを押してくださいの画面がもう一度でる．理由は不明．
	endif
endfunction

