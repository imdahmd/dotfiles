(defvar clojure-packages '(better-defaults
			   clojure-mode
			   cider))

(dolist (p clojure-packages)
  (unless (package-installed-p p)
    (package-install p)))
