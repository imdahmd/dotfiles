(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(setq projectile-project-search-path '("~"))

;; https://projectile.readthedocs.io/en/latest/installation/
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
