;;; coldnew-command.el ---
(eval-when-compile (require 'cl))

(require 'coldnew-functions)

;;;; ---------------------------------------------------------------------------
;;;; Buffer
;;;; ---------------------------------------------------------------------------
(defun save-buffer-always ()
  "Save the buffer even if it is not modified."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

;;;; ---------------------------------------------------------------------------
;;;; Date
;;;; ---------------------------------------------------------------------------

(defun insert-date-time ()
  "Insert current-date."
  (interactive)
  (insert (current-date-time)))

;;;; ---------------------------------------------------------------------------
;;;; Search
;;;; ---------------------------------------------------------------------------
(defun multi-occur-in-this-mode ()
  "Show all lines matching REGEXP in buffers with this major mode."
  (interactive)
  (multi-occur
   (get-buffers-matching-mode major-mode)
   (car (occur-read-primary-args)))
  (select-window (get-buffer-window "*Occur*")))

;;;; ---------------------------------------------------------------------------
;;;; Delete
;;;; ---------------------------------------------------------------------------
(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

;;;; ---------------------------------------------------------------------------
;;;; key-macro
;;;; ---------------------------------------------------------------------------
(defun toggle-kbd-macro-recording-on ()
  "One-key keyboard macros: turn recording on."
  (interactive)
  (define-key
    global-map
    (this-command-keys)
    'toggle-kbd-macro-recording-off)
  (start-kbd-macro nil))

(defun toggle-kbd-macro-recording-off ()
  "One-key keyboard macros: turn recording off."
  (interactive)
  (define-key
    global-map
    (this-command-keys)
    'toggle-kbd-macro-recording-on)
  (end-kbd-macro))

;;;; ---------------------------------------------------------------------------
;;;; Commands that define for key-chord
;;;; ---------------------------------------------------------------------------
(defun upcase-word-backward ()
  "upcase word backward."
  (interactive)
  (upcase-word -1))

(defun downcase-word-backward ()
  "downcase word backward."
  (interactive)
  (downcase-word -1))

(defun capitalize-word-backward ()
  "captialize word backward."
  (interactive)
  (capitalize-word -1))


;; ;; TODO: move me to other files
;; (add-hook 'occur-mode-hook 'hl-line-mode)

(provide 'coldnew-command)
;; coldnew-command.el ends here.
