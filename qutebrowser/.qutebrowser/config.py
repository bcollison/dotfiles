config.load_autoconfig()
config.source('searchengines.py')
c.hints.selectors["frame"] = ['div', 'header', 'section', 'nav']  
config.bind('<Alt-f>', 'hint frame', mode='normal')

# Bindings for normal mode
config.bind(',pe', 'spawn --userscript qute-lastpass --password-only')
config.bind(',pq', 'spawn --userscript qute-lastpass')
config.bind(',pw', 'spawn --userscript qute-lastpass --username-only')

# Binds for moving through completion items
config.bind('<Ctrl-n>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-p>', 'completion-item-focus prev', mode='command')
