;;; Code:

(provide 'init-auto-complete)
(eval-when-compile
  (require 'cl))

(when (require 'auto-complete nil 'noerror)
  (global-auto-complete-mode t)		; 全域啟動自動補全

  (when (require 'auto-complete-config nil 'noerror)
    (ac-config-default))

  (setq ac-use-fuzzy      nil )		; 關閉模糊補全
  (setq ac-auto-start     nil )		; 關閉自動補全
  (setq ac-ignore-case 'smart )		; 使用智能補全
  (setq ac-use-menu-map     t )		; 啟用補全選單
  (setq ac-use-comphist     t )
  (setq ac-use-quick-help   t )
  (setq ac-comphist-file "~/.emacs.d/var/cache/auto-complete.cache")

  (setq-default ac-sources
		'(ac-source-abbrev     ac-source-semantic  ac-source-symbols
		  ac-source-filename   ac-source-functions ac-source-variables
		  ac-source-dictionary ac-source-files-in-current-dir
		  ac-source-words-in-same-mode-buffers))

  (define-key ac-menu-map (kbd "C-n") 'ac-next)
  (define-key ac-menu-map (kbd "C-p") 'ac-previous)
  (define-key ac-completing-map "\t" 'ac-complete)

  (when (require 'init-vim nil 'noerror)
    (vim:imap (kbd "C-p") 'auto-complete)
    (vim:imap (kbd "C-n") 'auto-complete))
  (when (require 'ac-company nil 'noerror)
    (ac-company-define-source ac-source-company-abbrev    company-abbrev   (symbol . "s"))
    (ac-company-define-source ac-source-company-clang     company-clang    (symbol . "s"))
    (ac-company-define-source ac-source-company-css       company-css      (symbol . "s"))
    (ac-company-define-source ac-source-company-dabbrev   comapny-dabbrev  (symbol . "s"))
    (ac-company-define-source ac-source-company-eclim     company-eclim    (symbol . "s"))
    (ac-company-define-source ac-source-company-elisp     company-elisp    (symbol . "s"))
    (ac-company-define-source ac-source-company-etags     company-etags    (symbol . "s"))
    (ac-company-define-source ac-source-company-files     company-files    (symbol . "s"))
    (ac-company-define-source ac-source-company-gtags     company-gtags    (symbol . "s"))
    (ac-company-define-source ac-source-company-ispell    comapny-ispell   (symbol . "s"))
    (ac-company-define-source ac-source-company-keywords  company-keywords (symbol . "s"))
    (ac-company-define-source ac-source-company-nxml      company-nxml     (symbol . "s"))
    (ac-company-define-source ac-source-company-semantic  comapny-semactic (symbol . "s")))
  )

;;; init-auto-complete.el ends here
