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

;; alt+3 == # (For UK keyboard)
;; https://stackoverflow.com/questions/3977069/emacs-question-hash-key
(global-set-key (kbd "M-3") (lambda () (interactive) (insert "#")))

;; start emacs with frame maximized
;; https://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Set command key to super on mac
;; https://stackoverflow.com/questions/14905133/how-to-set-cmd-key-binding-in-emacs
(when (memq window-system '(mac ns x))
  (setq mac-command-modifier 'super))

;; Save emacs state (open files)
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html
(desktop-save-mode 1)
(setq desktop-save t)

;; Spaces instead of tabs
;; https://www.emacswiki.org/emacs/NoTabs
(setq-default indent-tabs-mode nil)

;; Tab size 2
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Changing-the-length-of-a-Tab.html
(setq-default tab-width 2)

;; Kill buffer without the need for confirmation, unless the buffer has been modified
;; https://stackoverflow.com/questions/6467002/how-to-kill-buffer-in-emacs-without-answering-confirmation
(global-set-key [(control x) (k)] 'kill-this-buffer)

;; Use paredit while editing clojure code
;; https://github.com/clojure-emacs/clojure-mode
(add-hook 'clojure-mode-hook #'paredit-mode)

;; Add babashka as a recognised interpreted script
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Associating-modes-with-files.html
(add-to-list 'interpreter-mode-alist '("bb" . clojure-mode))

;; Fix for "error in process sentinel: Error retrieving: https://elpa.gnu.org/packages/archive-contents (error connection-failed "connect" :host "elpa.gnu.org" :service 443) [2 times]"
;; https://emacs.stackexchange.com/questions/68288/error-retrieving-https-elpa-gnu-org-packages-archive-contents
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
