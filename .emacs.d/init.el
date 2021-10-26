
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

(defun read-string-from-file (file)
  (with-temp-buffer
    (insert-file-contents (expand-file-name file user-init-dir))
    (buffer-string)))

(load-user-file "emacs-settings.el")
(load-user-file "requires.el")
(load-user-file "projectile.el")
(load-user-file "multiple-cursors.el")
(load-user-file "cider.el")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(load "server")
(unless (server-running-p) (server-start))
