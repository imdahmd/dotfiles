(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(setq projectile-project-search-path '("~"))

;; https://projectile.readthedocs.io/en/latest/installation/
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

;; Discover projects
;; https://docs.projectile.mx/projectile/usage.html#basic-setup
(setq projectile-project-search-path '("~/Projects/" "~/Personal/" "~/ThoughtWorks/"))
