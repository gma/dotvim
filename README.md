My Vim Config
=============

**Note:** I use Neovim by default these days, but still keep this Vim 8 config
around for use on computers where Neovim isn't installed. If you're looking at
for inspiration on how to configure Vim for doing software development, I'd
suggest my [nvim-config repository] instead.

I install this repository to every computer I work on:

    $ git clone github@github.com:gma/dotvim.git ~/.vim
    $ git submodule update --init

Feel free to have a poke around, but (rather than copying it) I recommend
building up your own Vim config by hand. You'll learn a lot more and are likely
to end up with a setup that's just right for you.

[nvim-config repository]: https://github.com/gma/nvim-config

Adding new plugins
------------------

Plugins are installed as git submodules, and loaded using Vim 8's builtin
support for packages. I am using the minpac plugin manager, but only as a
convenient way of updating plugins that I've already installed as git
submodules.

I prefer installing plugins as git submodules because:

- I can test the new version of a plugin and rollback more easily if there are
  breaking changes, or if it's an inconvenient time for me to pause and learn
  about changes to a plugin.

  I've found several plugins have changed their mappings and commands over the
  years that I've been using Vim, and it can take me a while to unlearn old
  keybindings. I like to choose whether now's a good time to make the switch,
  and submodules make it extremely easy to roll back.

- I know I've got the same versions of the submodules on all of my computers.
  If I only used minpac to update submodules I'd likely get different versions
  to my known-working config if/when I setup a new computer.

I've written the `add-plugin` script to help me remember exactly what to do
when adding a new plugin.

When considering whether to make a plugin optional (`add-plugin -o`) it's worth
noting that filetype plugins (e.g. those with an `ftdetect` directory) should
be installed in `pack/minpac/start`.

This is because they generally don't do much until you open a file of the
relevant type, and are effectively [loaded on demand] anyway. The small amount
of code that they do load is useful for filetype detection.

After installing a new plugin run `:helptags ALL` to re-index Vim's links to
your plugins' docs.

[loaded on demand]: https://vi.stackexchange.com/a/20818/37882

Updating plugins
----------------

minpac makes this really easy. If it didn't, minpac wouldn't even be installed
(I'd just be managing them all as submodules).

Run the `:PackUpdate` Vim command. It'll pull updates for all installed
packages.

To read through the changes you've just downloaded, run `:PackStatus`. If there
are any changes you're not keen on pulling in right now you can use `git` to
rewind the changes in a plugin's submodule.

If it looks good, commit.

    $ git add pack/
    $ git commit -m "Upgraded Vim plugins with minpac"

If you encounter problems you can always roll back, then investigate later.

Run `:helptags ALL` to re-index Vim's links to your plugins' docs.

Removing plugins
----------------

You need to [delete the submodule][delete]. In recent versions of git this is
as simple as:

    $ git rm pack/minpack/start/<dir>

Then remove the corresponding `minpac` config in `packages.vim`.

`:helptags ALL` will re-index Vim's links to your plugins' docs.

[delete]: https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule

To switch to a fork of a plugin
-------------------------------

If you want to switch to somebody else's implementation of a plugin, we
can update the minpac config in `packages.vim`, then point the submodule at a
different repo:

    $ git config --file=.gitmodules submodule.<module-path>.url <repo-url>
    $ git submodule sync

What I've read online suggests the above should be enough, but when
switching from `tpope/vim-markdown` to `gabrielelana/vim-markdown` I found I
also needed to do:

    $ cd path/to/vim-markdown
    $ git fetch origin
    $ git checkout master
    $ git reset --hard origin/master

Then, back in the main repo, commit the changes:

    $ git add <module-path>
    $ git commit -m "Switch to Gabriele Lana's vim-markdown plugin"

You may as well run `:helptags` to re-index the docs.
