(unless (package-installed-p 'paradox)
  (package-install 'paradox))

(setq paradox-github-token (read-string-from-file "paradox-github-token"))
