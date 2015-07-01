;; Settings for backup
;; Ref: http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
;; create ~/.saves dir
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; word wrap
(global-visual-line-mode t)
(setq org-startup-indented t)

