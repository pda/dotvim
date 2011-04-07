~pda/.vim/
==========

My MacVim setup, coloured in [ir_black](http://blog.infinitered.com/entries/show/8), with [Command-T](https://wincent.com/products/command-t), [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658), [Buffer Explorer](http://www.vim.org/scripts/script.php?script_id=42) and more.
Geared towards writing Ruby, Rails, and once upon a time, PHP.


Install.
--------

    # backup what you've got
    mv .vim .vim-backup
	mv .vimrc .gvimrc .vim-backup

    # grab from GitHub
	git clone git://github.com/pda/dotvim.git .vim

    # symlink the rc files into your home directory
	ln -s .vim/vimrc .vimrc
	ln -s .vim/gvimrc .gvimrc

	# misc setup
	cd ~/.vim/bundle/command-t ; rake make


Background.
-----------

Some posts that helped me along the way:

  - [Steve Losh - Coming Home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
  - [Stephen Bach - Configuring Vim Right](http://items.sjbach.com/319/configuring-vim-right)
  - [Google Tech Talk video by creator of Vim](http://video.google.com/videoplay?docid=2538831956647446078)
  - [Vim Recipes - A free online book on using Vim](http://vim.runpaint.org/)
  - [Jonathan McPherson - Efficient Editing with Vim](http://jmcpherson.org/editing.html)


Bam.
----

[<img src="https://github.com/pda/dotvim/raw/master/documentation/vim_ir_black_sc1.png"/>](http://blog.infinitered.com/entries/show/8)
