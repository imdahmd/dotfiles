(require 'package)

(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
 (package-refresh-contents))

;(package-install-selected-packages)
