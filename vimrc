"filename .vimrc

"----------基本----------
"vi互換モードをオフ
set nocompatible
"ファイルタイプごとの設定を有効化
filetype plugin indent on
"バッファを保存しなくても他のバッファを表示できるようにする
set hidden
"ビープ -> フラッシュベル
set visualbell
"行番号の表示
set number
"カーソルが何行目にあるかを表示
set ruler
"バックアップ設定
set backup
set undofile
if !isdirectory(expand("~/.vim/backup"))
  silent! call mkdir(expand("~/.vim/backup"), "p")
endif
if !isdirectory(expand("~/.vim/undo"))
  silent! call mkdir(expand("~/.vim/undo"), "p")
endif
set backupdir=~/.vim/backup//
set directory=~/.vim/backup//
set undodir=~/.vim/undo//
"検索で大文字小文字を区別しない
set ignorecase
"検索で大文字が入ると区別して検索
set smartcase
"ステータスラインを常に表示
set laststatus=2

"----------色指定----------
" ctermbg=ターミナル時の背景色
" ctermfg=ターミナル時の文字色
"シンタックスハイライトの有効化
syntax on
""コメントの色を変更"
highlight Comment ctermfg=Blue
"括弧入力時の対応する括弧を表示
set showmatch
"インクリメンタルな検索
set incsearch
"検索結果文字列のハイライトを有効にする
set hlsearch
"カーソルラインをハイライト
set cursorline

"----------tab/インデント----------
"オートインデントの有効化
set autoindent
set smartindent
"tab文字の展開する文字数の指定
set tabstop=4
"インデント数
set shiftwidth=4
"tabキーの文字数(0の場合はtabstop分入力される)
set softtabstop=0
"tabを半角スペースにする
set expandtab
"tabの表示
set list
set listchars=tab:->,nbsp:%

"----------行末スペースのハイライト----------
highlight ZenkakuSpace cterm=underline ctermfg=lightblue
highlight TrailingSpaces term=underline guibg=Red ctermbg=Red

augroup HighlightWhitespace
  autocmd!
  autocmd ColorScheme * highlight ZenkakuSpace cterm=underline ctermfg=lightblue
  autocmd ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter,BufWinEnter * call s:highlight_whitespace()
augroup END

function! s:highlight_whitespace() abort
  if exists("w:trailing_spaces_match_id")
    call matchdelete(w:trailing_spaces_match_id)
  endif
  if exists("w:zenkaku_space_match_id")
    call matchdelete(w:zenkaku_space_match_id)
  endif
  let w:trailing_spaces_match_id = matchadd("TrailingSpaces", '\s\+$')
  let w:zenkaku_space_match_id = matchadd("ZenkakuSpace", "　")
endfunction

"----------other----------
"コマンドモードの補完有効化
set wildmenu
set wildmode=longest:full,full
"コマンド履歴の補完数の変更
set history=100
"検索ハイライトを素早く解除
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
"クリップボードからのペースト時にインデントを無効化
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
"'()','{}'の補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><Esc><S-o>
inoremap ( ()<Left>
inoremap (<Enter> ()<Left><CR><Esc><S-o>
