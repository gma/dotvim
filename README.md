My Vim Config
=============

I install this repository to every computer I work on:

    $ git clone github@github.com:gma/dotvim.git ~/.vim
    $ git submodule update --init

Feel free to have a poke around, but (rather than copying it) I recommend
building up your own Vim config by hand. You'll learn a lot more and are likely
to end up with a setup that's just right for you.

Adding new plugins
------------------

Plugins are installed as git submodules, and loaded using Vim 8's builtin
support for packages. I am using the minpac plugin manager, but only as a
convenient way of pulling down updates to my installed submodules.

I prefer this approach to just using minpac to install the latest version of a
plugin because:

- I can test the new version of a plugin and rollback if there are breaking
  changes, or if it's an inconvenient time for me to adopt a new version.

  I've found several plugins have changed their mappings and commands over the
  years that I've been using Vim, and it can take me a while to unlearn old
  keybindings. I like to choose whether now's a good time to make the switch,
  and submodules make it extremely easy to roll back.

- I know I've got the same versions of the submodules on all of my computers.

So to add a new plugin I:

- Use `git submodule add` to clone it into a subdirectory of `pack/minpac`
- Add a call to `minpac#add()` in `packages.vim`

To remove a plugin
------------------

You need to [delete the submodule][delete], then remove the corresponding
`minpac` config in `packages.vim`.

[delete]: https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule

To use a different fork of a bundle
-----------------------------------

If you want to switch to somebody else's implementation of a bundle, we
can just point the submodule at a different repo:

    $ git config --file=.gitmodules submodule.<module-path>.url <repo-url>
    $ git submodule sync

What I've read online suggests the above should be enough, but when
switching from tpope/vim-markdown to gabrielelana/vim-markdown I found I also
needed to do:

    $ cd path/to/vim-markdown
    $ git fetch origin
    $ git checkout master
    $ git reset --hard origin/master

Then, back in the main repo, commit the changes:

    $ git add <module-path>
    $ git commit -m "Switch to Gabriele Lana's vim-markdown plugin"
