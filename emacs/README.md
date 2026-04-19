AppleScript-- save as Application org-protocol.app
on open location this_URL
	do shell script "/usr/local/Cellar/emacs-plus@29/29.1/bin/emacsclient \"" & this_URL & "\""
	tell application "Emacs" to activate
end open location

open Info.plist
add:
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLName</key>
    <string>org-protocol handler</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>org-protocol</string>
    </array>
  </dict>
</array>


org-protocol chrome extension
defaults write com.google.Chrome URLAllowlist -array-add -string 'org-protocol://*'

