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

;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
          "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
	  (interactive "*P")
	  (comment-normalize-vars)
	  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
	      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
	    (comment-dwim arg)))
      (global-set-key "\M-;" 'comment-dwim-line)

;; yank and indent
;; http://emacswiki.org/emacs/AutoIndentation#toc3
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
	   (and (not current-prefix-arg)
		(member major-mode '(emacs-lisp-mode lisp-mode
						     clojure-mode    scheme-mode
						     haskell-mode    ruby-mode
						     rspec-mode      python-mode
						     c-mode          c++-mode
						     objc-mode       latex-mode
						     plain-tex-mode  rust-mode))
		(let ((mark-even-if-inactive transient-mark-mode))
		                     (indent-region (region-beginning) (region-end) nil))))))

;; alt+3 == # (For UK keyboard)
;; https://stackoverflow.com/questions/3977069/emacs-question-hash-key
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; insert today's date: 30-08-2018
;; https://www.emacswiki.org/emacs/InsertingTodaysDate
(defun insert-current-date () (interactive)
       (insert (shell-command-to-string "echo -n $(date +%d-%m-%Y)")))

;; start emacs with frame maximized
;; https://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; To ensure environment variables inside Emacs look the same as in the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
