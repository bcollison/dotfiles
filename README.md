When running emacs daemon on macos using brew services, you need to fix the plist file 
e.g.: /usr/local/Cellar/emacs-plus@29/29.0.90/homebrew.mxcl.emacs-plus@29.plist

the executable needs to be something like :      
           <string>/usr/local/Cellar/emacs-plus@29/29.0.90/Emacs.app/Contents/MacOS/Emacs</string>
otherwise it won't be able to read the Dropbox folders
