(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("marmalade" . "https://marmalade-repo.org/packages/")
       '("org"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/")
       '("gnu"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/"))
(package-initialize)
