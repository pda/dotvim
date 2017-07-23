# 💀💀💀 ~pda/.vim/ 💀💀💀

💀💀💀 **switched to Neovim; see [pda/config-neovim](https://github.com/pda/config-neovim)** 💀💀💀

Nicely commented [.vimrc][vimrc], 256-color,
and a [useful set of plugins][gitmodules] managed by [pathogen][pathogen].

I run it in [tmux](http://tmux.sourceforge.net/)
inside (non-Lion) full-screen [iTerm2](http://www.iterm2.com/)
with xterm-256color profile.

[vimrc]: https://github.com/pda/dotvim/blob/master/vimrc
[gitmodules]: https://github.com/pda/dotvim/blob/master/.gitmodules
[pathogen]: https://github.com/tpope/vim-pathogen

```
# backup what you've got
mv .vim .vim-backup
mv .vimrc .gvimrc .vim-backup

# grab from GitHub
git clone --recursive git://github.com/pda/dotvim.git .vim

# symlink the rc file into your home directory
ln -s .vim/vimrc .vimrc
```

Some posts that helped me in the early days:

  - [Steve Losh - Coming Home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
  - [Stephen Bach - Configuring Vim Right](http://items.sjbach.com/319/configuring-vim-right)
  - [Google Tech Talk video by creator of Vim](http://video.google.com/videoplay?docid=2538831956647446078)
  - [Vim Recipes - A free online book on using Vim](http://vim.runpaint.org/)
  - [Jonathan McPherson - Efficient Editing with Vim](http://jmcpherson.org/editing.html)
