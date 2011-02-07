;;
(eval-when-compile (require 'cl))

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

(defadvice kill-buffer (around kill-buffer-around-advice activate)
  "bury *scratch* or *Ibuffer* buffer instead of kill it "
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (or (equal buffer-to-kill "*scratch*")
	    (equal buffer-to-kill "*Ibuffer*"))
	(bury-buffer)
      ad-do-it)))

(defadvice find-file (around find-file-set-trigger-variable protect activate)
  "bind a variable so that history command can do special behavior for find-file"
  (interactive (let (inside-find-file-command) (find-file-read-args "Find file: " nil)))
  ad-do-it)

(defadvice next-history-element (around next-history-element-special-behavior-for-find-file protect activate)
  "when doing history for find-file, use the buffer-list as history"
  (if (boundp 'inside-find-file-command)
      (let ((find-file-history (delq nil (mapcar 'buffer-file-name (buffer-list))))
	    (minibuffer-history-variable 'find-file-history))
	ad-do-it)
    ad-do-it))

;; BUG: when use sort-lines, this will prompt
;; (defadvice kill-buffer (around my-kill-buffer-check activate)
;;   "Prompt when a buffer is about to be killed."
;;   (let* ((buffer-file-name (buffer-file-name))
;;	 backup-file)
;;     ;; see 'backup-buffer
;;     (if (and (buffer-modified-p)
;;	     buffer-file-name
;;	     (file-exists-p buffer-file-name)
;;	     (setq backup-file (car (find-backup-file-name buffer-file-name))))
;;	(let ((answer (completing-read (format "Buffer modified %s, (d)iff, (s)ave, (k)ill? " (buffer-name))
;;				       '("d" "s" "k") nil t)))
;;	  (cond ((equal answer "d")
;;		 (set-buffer-modified-p nil)
;;		 (let ((orig-buffer (current-buffer))
;;		       (file-to-diff (if (file-newer-than-file-p buffer-file-name backup-file)
;;					 buffer-file-name
;;				       backup-file)))
;;		   (set-buffer (get-buffer-create
;;				(format "%s last-revision" (file-name-nondirectory file-to-diff))))
;;		   (buffer-disable-undo)
;;		   (insert-file-contents file-to-diff nil nil nil t)
;;		   (set-buffer-modified-p nil)
;;		   (setq buffer-read-only t)
;;		   (ediff-buffers (current-buffer) orig-buffer)))
;;		((equal answer "k")
;;		 (set-buffer-modified-p nil)
;;		 ad-do-it)
;;		(t
;;		 (save-buffer)
;;		 ad-do-it)))
;;       ad-do-it)))




(provide '005-advices)
;; 005-advices.el ends here.
