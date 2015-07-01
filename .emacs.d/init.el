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

(load-user-file "emacs-settings.el")
(load-user-file "requires.el")
(load-user-file "clojure.el")
(load-user-file "java.el")
