(defvar clojure-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider))

(dolist (p clojure-packages)
  (unless (package-installed-p p)
    (package-install p)))
