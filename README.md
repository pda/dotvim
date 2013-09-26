~pda/.vim/
==========

My ~~MacVim~~ vim setup,
coloured in [Jellybeans](https://github.com/nanotech/jellybeans.vim) (modified),
with [ctrlp.vim](http://kien.github.com/ctrlp.vim/),
[Powerline](https://github.com/Lokaltog/vim-powerline),
[NERDTree](http://www.vim.org/scripts/script.php?script_id=1658),
[Buffer Explorer](http://www.vim.org/scripts/script.php?script_id=42)
and more.

I run it in [tmux](http://tmux.sourceforge.net/)
inside (non-Lion) full-screen [iTerm2](http://www.iterm2.com/)
with xterm-256color profile.


Install.
--------

```
# backup what you've got
mv .vim .vim-backup
mv .vimrc .gvimrc .vim-backup

# grab from GitHub
git clone git://github.com/pda/dotvim.git .vim

# symlink the rc file into your home directory
ln -s .vim/vimrc .vimrc
```

Background.
-----------

Some posts that helped me along the way:

  - [Steve Losh - Coming Home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
  - [Stephen Bach - Configuring Vim Right](http://items.sjbach.com/319/configuring-vim-right)
  - [Google Tech Talk video by creator of Vim](http://video.google.com/videoplay?docid=2538831956647446078)
  - [Vim Recipes - A free online book on using Vim](http://vim.runpaint.org/)
  - [Jonathan McPherson - Efficient Editing with Vim](http://jmcpherson.org/editing.html)
