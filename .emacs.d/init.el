
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
	 user-emacs-directory)
	((boundp 'user-init-directory)
	 user-init-directory)
	(t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file is current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(load-user-file "requires.el")
(load-user-file "tweaks.el")

(load "server")
(unless (server-running-p) (server-start))
