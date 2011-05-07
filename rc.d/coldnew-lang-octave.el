;;
(eval-when-compile (require 'cl))

;;;;;;;; Packages Import
(require 'coldnew-editor)
(require 'ac-octave)


;;;;;;;; Octave-mode extensions
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;;Auto Complete Settings
(when (require* 'auto-complete)
  (defun ac-octave-mode-setup ()
    "auto-complete settings for emacs-lisp-mode"
    (setq ac-sources
	  '(
	    ac-source-octave
	    ))))


(add-hook 'octave-mode-hook
	  '(lambda ()

	     (ac-octave-mode-setup)

	     (programming-mode)
	     ))




(provide 'coldnew-lang-octave)
;; coldnew-lang-octave.el ends here.