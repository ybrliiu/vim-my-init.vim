" filetype ごとの設定

augroup auto_comment_off
  autocmd!

  " perl関連
  autocmd BufNewFile,BufRead *.psgi   set filetype=perl
  autocmd BufNewFile,BufRead *.t      set filetype=perl
  autocmd BufNewFile,BufRead *.cgi    set filetype=perl
  autocmd BufNewFile,BufRead *.conf   set filetype=perl
  autocmd BufNewFile,BufRead cpanfile set filetype=perl
  autocmd BufNewFile,BufRead *.spvm   set filetype=perl

 " rubyのための設定
  autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html

  " htmlのための設定
  autocmd BufNewFile,BufRead *.html.ep  set filetype=eruby.html

  " vueのための設定, 長いファイルで途中でsyntax highlightが効かなくなることを避けるために,
  " ファイルの先頭からパースしてハイライトを行う設定を追記
  autocmd FileType vue syntax sync fromstart

augroup END

" バイナリ編集モード (nvim -b での起動、もしくは *.bin ファイルを開くと発動)
" xxd コマンドをかましてバイナリを編集できるようにする
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary=1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r
  autocmd BufWritePre * endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

