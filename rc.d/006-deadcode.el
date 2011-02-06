;;
(eval-when-compile (require 'cl))

;;;; Macros

(defmacro partial (f &rest args)
  `(lambda (&rest more)
     (apply ',f ,@args more)))

(defmacro lexdef (name args &rest body)
  "Defun with lexically-scoped parameters. Could also be called lexical-defun."
  `(defun ,name ,args
     (lexical-let ,(->> args
			(remove-if (partial equal '&rest))
			(mapcar (lambda (arg) (list arg arg))))
       ,@body)))

;; (defmacro require-maybe (feature &optional file)
;;   "*Try to require FEATURE, but don't signal an error if `require' fails."
;;   `(require ,feature ,file 'noerror))


;; Math

(defun mean (values)
  (/ (reduce '+ values)
     (float (length values))))

(defun square (x)
  (* x x))

(defun variance (values)
  (- (->> values (mapcar 'square) mean)
     (square (mean values))))

;; Sequences

(defun sequence (maybe-seq)
  "Returns the value wrapped in a sequence if it is not a sequence already."
  (if (sequencep maybe-seq) maybe-seq
    (list maybe-seq)))

(defun random-elt (sequence)
  (elt sequence
       (-> sequence length random)))

(defun seq-difference (lseq rseq)
  (remove-if (lambda (element) (find element rseq :test 'equal))
	     lseq))

;; Strings

(defun string-empty-p (str)
  (if str
      (string= "" str)
    t))

(defun string-not-empty-p (str)
  (not (string-empty-p str)))

(defun string-blank-p (str)
  (if (string-empty-p str)
      t
    (not (null (string-match "^\\(?:\s*\n\\)*$" str)))))

(defun string-not-blank-p (str)
  (not (string-blank-p str)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Undestructive alist functions

(defun alist-get (alist key &optional default)
  (or (assoc-default key alist)
      default))

(defun alist-remove (alist key)
  "Doesn't change the original alist, returns a new one instead."
  (remove-if (lambda (x) (equal key (car x)))
	     alist))

(defun alist-set (alist key value)
  "Doesn't change the original alist, returns a new one instead."
  (cons (cons key value) (alist-remove alist key)))

;;;;
;; (defun require* (feature &optional force)
;;   (when (or force (not (featurep feature)))
;;     (setq feature (symbol-name feature))
;;     (let ((path load-path)
;;	  (found-filename nil)
;;	  head el-attribs elc-attribs)
;;       (while (and (not found-filename) path)
;;	(setq head (pop path))
;;	(let ((el-filename (format "%s/%s.el" head feature))
;;	      (elc-filename (format "%s/%s.elc" head feature)))
;;	  ;; if .el and .elc both exist, pick the newest
;;	  ;; otherwise pick the one that exists if any
;;	  (cond ((and (file-exists-p el-filename)
;;		      (file-exists-p elc-filename))
;;		 (if (file-newer-than-file-p el-filename elc-filename)
;;		     (setq found-filename el-filename)
;;		   (setq found-filename elc-filename)))
;;		((file-exists-p el-filename)
;;		 (setq found-filename el-filename))
;;		((file-exists-p elc-filename)
;;		 (setq found-filename elc-filename)))
;;	  ;; load file if found
;;	  (when found-filename
;;	    (message (format "Found: [%s]" found-filename))
;;	    (let ((load-suffixes ()))
;;	      (load found-filename)))))
;;       (unless found-filename (error "Unable to find %s" feature)))))


;;(setq-default header-line-format mode-line-format) ; Copy mode-line to top
;;(setq-default mode-line-format nil) ; Remove mode-line
;; (defcmd show-mode-line ()
;;   (if mode-line-format
;;       (setq mode-line-format nil)
;;     (setq mode-line-format	t)))


;;;;;;;; 將指定目錄裡的東西全部加入清單
;; (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;     (let* ((my-lisp-dir "~/.emacs.d/")
;;	   (default-directory my-lisp-dir))
;;       (setq load-path (cons my-lisp-dir load-path))
;;       (normal-top-level-add-subdirs-to-load-path)))



(provide '006-deadcode)
;; 006-deadcode.el ends here.