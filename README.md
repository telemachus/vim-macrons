# macrons: a {neo,}vim plugin for adding and deleting macrons

## INTRODUCTION

A set of utility functions and mappings to make it easier to add or remove
macrons from vowels.

## COMMANDS

    [range]Demacronize	" Remove macrons from a range of lines
    [range]Macronize	" Add macrons to a range of lines

Both functions accept an optional range. If no range is given, they default to
the entire file. This makes it simple to remove the macrons from a whole file
quickly.

## CUSTOMIZING

Three maps are available, one for normal mode and two for visual mode. Add
whatever key mappings you prefer to `~/.vimrc` or `~/.config/nvim/init.vim`
file. For example,

    " In normal mode, flip the macron on a single vowel.
    " That is, if the vowel has a macron, remove it, and if it doesn’t
    " have a macron, add one.
    map <silent> <leader>mf <Plug>CharMacronFlip

    " Place macrons on all the vowels in a visual selection.
    map <silent> <leader>mo <Plug>MacronsOn

    " Remove all the  macrons from a visual selection.
    map <silent> <leader>nm <Plug>MacronsOff

All the mappings can be repeated with `.` if you have Tim Pope’s excellent
[vim-repeat][repeat] installed. You should really install that if you don’t
have it already. (Did I mention that it’s excellent?)

## INSTALLATION

The easiest way to install is with [vim-pathogen][pathogen]. Install that
first, and then simply do the following:

    cd ~/.vim/bundle	" or cd ~/.config/nvim/bundle
    git clone https://bitbucket.org/telemachus/vim-macrons

## ISSUES

Only the macrons on vowels are added, removed, or flipped. This is by design,
but maybe that’s a mistake. Let me know if you think so.

[repeat]: https://github.com/tpope/vim-repeat
[pathogen]: https://github.com/tpope/vim-pathogen

## LICENSE

See LICENSE.md for details, but in a nutshell BSD 3-clause.
