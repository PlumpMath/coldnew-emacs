
;;;;;
(provide 'init-session)

(setq session-save-file "~/.emacs.d/system/session") ;
(when (require 'session nil 'noerror)
  (add-hook 'after-init-hook 'session-initialize)
  (add-to-list 'session-globals-exclude 'org-mark-ring))
