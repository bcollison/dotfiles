# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles managed with **GNU Stow**. Each top-level directory is a stow package whose contents mirror `$HOME`. Running `stow <package>` from the repo root symlinks the package's files into `$HOME`.

## Deploying Configs

```bash
# Symlink a package into $HOME
stow zsh
stow git
stow emacs

# Remove symlinks for a package
stow -D zsh

# Simulate (dry-run)
stow -n zsh
```

## Encryption

Sensitive files use **git-crypt**. Files matching `*.private`, `mbsync/*`, and `duply/.duply/*/conf` are encrypted at rest (see `.gitattributes`). You need the git-crypt key to access them.

## Package Structure

| Directory | What it configures |
|-----------|-------------------|
| `zsh/` | `.zshrc` + `.zshrc.d/` (oh-my-zsh, plugins, aliases) |
| `git/` | `.gitconfig`, `.gitconfig-personal`, `.gitconfig-work.private` |
| `emacs/` | Full Emacs config — `init.el` bootstraps `use-package`, then loads a literate org config (`rewrite-configuration-from-scratch.org`) |
| `brew/` | `Brewfile` for all Homebrew packages/casks; `README.md` has post-install notes |
| `mbsync/` | `isync`/`mbsync` configs + LaunchAgent plists for automated mail sync every 5 min |
| `duply/` | Duplicity backup profiles (encrypted configs) |
| `bash/` | Bash fallback config |
| `zsh/.zshrc.d/` | Extra zsh snippets (e.g. `work.zsh.private`) |

## Key Architecture Notes

### Git identity splitting
`.gitconfig` applies work identity globally, but `[includeIf "gitdir:~/Personal/"]` loads `.gitconfig-personal` (with `brian@briancollison.com`) for repos under `~/Personal/`. Work credentials live in `.gitconfig-work.private` (git-crypt encrypted, included via `[include]`).

### Emacs config loading chain
`init.el` → installs `use-package` if missing → `org-babel-load-file` on `rewrite-configuration-from-scratch.org`. All actual Emacs config lives in that org file, not `init.el`. The emacs-plus@29 daemon is managed via `brew services`; the plist at `emacs/homebrew.mxcl.emacs-plus@29.plist` must point to the full `.app` binary path (see `README.md` note about Dropbox access).

### Mail sync pipeline
`mbsync/mail-sync` and `mail-sync-personal` are shell scripts that run `mbsync -Va` then update the `mu` index (via `emacsclient` if the mu server is running). LaunchAgents in `mbsync/` schedule these every 300 seconds. mbsync channel configs (`.mbsyncrc`) are git-crypt encrypted.

### Zsh setup
oh-my-zsh with theme `mira`. macOS plugins: `z git jenv mvn zsh-autosuggestions alias-finder gradle-completion`. Linux adds `docker docker-compose golang gcloud`. The `.zshrc` includes an extensive set of Docker aliases (`dc`, `dcu`, `dcd`, `dex`, `dps`, etc.) and manages PATH entries for jenv, rvm, mysql-client, Charles, and local bin.

## macOS-Specific Setup Notes

- **emacs-plus@29** must be installed with: `brew install d12frosted/emacs-plus/emacs-plus@29 --with-ctags --with-dbus --with-imagemagick --with-mailutils --with-native-comp --with-no-frame-refocus --with-xwidgets`
- After install: `ln -s /usr/local/opt/emacs-plus@29/Emacs.app /Applications` and fix the brew services plist to use the full `.app/Contents/MacOS/Emacs` path
- **qutebrowser**: requires `sudo xattr -rd com.apple.quarantine /Applications/qutebrowser.app` after install
- **barrier**: requires generating SSL cert in `~/Library/Application Support/barrier/SSL/` post-install
- **JDK quarantine fix**: `xattr -d com.apple.quarantine /Library/Java/JavaVirtualMachines/<jdk>.jdk`
- **gradle-completion plugin**: `git clone https://github.com/gradle/gradle-completion ~/.oh-my-zsh/plugins/gradle-completion`
- **Show hidden files**: `defaults write com.apple.finder AppleShowAllFiles true && killall Finder`
