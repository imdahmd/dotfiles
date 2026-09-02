;;; my-functions.el --- custom functions -*- lexical-binding: t; -*-

(defun my/project-name ()
  "Return the current project name based on git root, or nil."
  (when-let* ((proj (project-current))
              (root (project-root proj)))
    (file-name-nondirectory (directory-file-name root))))

(defun quick-list-buffers ()
  "A function to quickly bring up the buffers list"
  (interactive)
    (progn
      (split-window-right)
      (list-buffers)
      (other-window 1)))

(defun goto-next-window ()
  (interactive)
  (other-window 1))

(defun goto-prev-window ()
  (interactive)
  (other-window -1))

(defun split-window-below-and-change-focus ()
  (interactive)
  (progn
    (split-window-below)
    (goto-next-window)))

(defun split-window-right-and-change-focus ()
  (interactive)
  (progn
    (split-window-right)
    (goto-next-window)))

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.
With a prefix ARG, prompt for a file to visit."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo::" (read-file-name "Find file (as root): ")))
    (find-file (concat "/sudo::" buffer-file-name))))
