This file shouldn't really live in this repo, but I can't think of a better place
right now, and I'm ok with it being here

brew install emacs-plus@28 --with-ctags --with-dbus --with-mailutils --with-no-frame-refocus --with-xwidgets --with-imagemagick --with-native-comp
ln -s /usr/local/opt/emacs-plus@28/Emacs.app /Applications
brew services start d12frosted/emacs-plus/emacs-plus@28

probably not the right place for this, but barrier required a post-install step of creating a key in: /Users/brian.collison/Library/Application Support/barrier/SSL/
I cd'd there and ran this:
   openssl req -x509 -nodes -days 365 -subj /CN=Barrier -newkey rsa:4096 -keyout Barrier.pem -out Barrier.pem

qutebrowser--
sudo xattr -rd com.apple.quarantine /Applications/qutebrowser.app
