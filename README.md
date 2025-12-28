# My Dotfiles

This repository contains my personal Arch Linux dotfiles including my personal scripts.  
Most of them should work on any Linux distribution with minimal adjustment.

At the moment, the focus is on **user-level configuration**, but some **root-level / system-wide configs** also exist and will be added gradually in the future where it makes sense.

Not all configurations here originated with me.  
Some are taken or inspired from other projects and setups:
- a few are **heavily modified** to fit my workflow,
- others have **minor tweaks** on top of upstream defaults.

Feedback, notes, and suggestions for alternative setups or environments are welcome.

This is a **rolling-release repository**. It will be continuously updated as my workflow, tools, and interests evolve—until I quit everything and start farming.

In that sense, this repo is also a small social experiment: a public record of how my preferences and ideas change over time.

I’ve tried to comment things as clearly as possible, and I’ll keep improving readability as the setup grows.

I’ll also try to list dependencies where it makes sense, but you’re a big guy, right?

---

## Setup

The recommended way to install these dotfiles is using [**GNU Stow**](https://www.gnu.org/software/stow/).

Clone the repository into your home directory:

```bash
git clone https://github.com/Zanzon2004/dotfiles.git
cd dotfiles
```
Then stow everything:
```bash
stow .
```
This will not work if you already have conflicting files in your home directory.
Back them up or move them elsewhere before running `stow`.

Example:
```bash
mv file file.back
```

## Repo structure
```text
.
├── .config
│   ├── bash
│   ├── dunst
│   ├── fastfetch
│   ├── feh
│   ├── glow
│   ├── htop
│   ├── lf
│   ├── mpd
│   ├── mpv
│   ├── nvim
│   ├── picom
│   ├── rmpc
│   ├── shell
│   ├── sxhkd
│   ├── wal
│   ├── wget
│   ├── x11
│   ├── ytfzf
│   ├── yt-x
│   ├── zathura
│   └── zsh
├── .local
│   └── bin
└── .zprofile -> .config/shell/profile
```
