<h2 align="center">Set Environment for my macos</h2>
<p align="center">
    <b><a href="README.md#How-to-use">How to use</a></b>
    |
    <b><a href="README.md#what-has-inside">What has inside</a></b>
    |
    <b><a href="README.md#Set-up">Setup</a></b>
</p>

This project is for initial setup of macos machine. The first time you run macos machine, you need to install some packages after install brew(or Mac port), and set up user configuration. These tasks are very inconvenient and cumbersome, therefore  you can be set up as a simple steps if you use this project.

---

## How to use
To configure with the default settings, enter the below as:

```bash
$ make install
$ make uninstall
```

## What has inside
- [completion](https://github.com/jhunahn/for-my-mac/tree/master/completion#set-bash-completions): bash-completion is a set of bash scripts which enables customized completion for specific commands.
- [configs](https://github.com/jhunahn/for-my-mac/tree/master/config#set-default-configs): set global options of Git and tig
- [shell](https://github.com/jhunahn/for-my-mac/tree/master/shell#set-bash-profile-or-managing-zsh-configuration): set bash profile or managing zsh configuration.
- [vim](https://github.com/jhunahn/for-my-mac/tree/master/vim#set-vimrc-with-vim-plugin-manager): Vim bundle and is a Vim plugin manager.

## Set up
To install various packages on a macos, you need to install brew.

```bash
$ make brew
```
