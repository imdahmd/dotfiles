(unless (package-installed-p 'smartparens)
  (package-install 'smartparens))

(require 'smartparens-config)
(sp-use-smartparens-bindings)
(setq sp-highlight-pair-overlay nil)
(add-hook 'clojure-mode-hook #'smartparens-mode)
