(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(setq projectile-project-search-path '("~/Projects/"))
