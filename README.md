When running emacs daemon on macos using brew services, you need to fix the plist file 
e.g.: /usr/local/Cellar/emacs-plus@29/29.0.90/homebrew.mxcl.emacs-plus@29.plist

the executable needs to be something like :      
           <string>/usr/local/Cellar/emacs-plus@29/29.0.90/Emacs.app/Contents/MacOS/Emacs</string>
otherwise it won't be able to read the Dropbox folders


git clone https://github.com/gradle/gradle-completion ~/.oh-my-zsh/plugins/gradle-completion

I had to install openjdk 17.0.7 manually, but the OS wouldn't let me run it... I solved that with:
xattr -d com.apple.quarantine /Library/Java/JavaVirtualMachines/jdk-17.0.7.jdk
after copying the contents to that location
