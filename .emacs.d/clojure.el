(defvar clojure-packages '(;better-defaults
			   projectile
			   clojure-mode
			   cider
			   paredit))

(dolist (cp clojure-packages)
  (unless (package-installed-p cp)
    (package-install cp)))

(add-hook 'clojure-mode-hook 'paredit-mode)

(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
			       (clj-refactor-mode 1)
			       (cljr-add-keybindings-with-prefix "C-c C-m")))
