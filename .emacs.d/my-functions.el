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
