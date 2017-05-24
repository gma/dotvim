My Vim Config
=============

I install this repository to every computer I work on:

    $ git clone github@github.com:gma/dotvim.git ~/.vim
    $ git submodule update --init

Feel free to have a poke around, but I recommend building up your own
Vim config by hand from all the blog posts and examples you can find on
the Internet. You'll learn so much more that way, and it'll make you a
more effective programmer.

Adding new bundles
------------------

Bundles are managed via pathogen, and are added as submodules. I'm using
submodules (rather than just cloning the repos into `./bundles`) so that
the bundles' source can be committed to the repo, but each bundle can be
updated independently, using `git`.

To add a new bundle as a submodule (rather than simply cloning it, which ):

To remove a bundle
------------------

You need to [delete the submodule][delete].

[delete]: https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule

To use a different fork of a bundle
-----------------------------------

If you want to switch to somebody else's implementation of a bundle, we
can just point the submodule at a different repo:

    $ git config --file=.gitmodules submodule.<module-path>.url <repo-url>
    $ git submodule sync

What I've read online suggests the above should be enough, but when
switching from tpope/vim-markdown bundle to gabrielelana/vim-markdown I
found I also needed to do:

    $ cd bundles/vim-markdown
    $ git fetch origin
    $ git checkout master
    $ git reset --hard origin/master

Then, back in the main repo, commit the changes:

    $ git add <module-path>
    $ git commit -m "Switch to Gabriele Lana's vim-markdown bundle"
