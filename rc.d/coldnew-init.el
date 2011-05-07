;;
(eval-when-compile (require 'cl))

;;;;;;;; Meta packages for cemacs

(require 'coldnew-macro)
(require 'coldnew-functions)
(require 'coldnew-variables)
(require 'coldnew-vim)
(require 'coldnew-emacs)
(require 'coldnew-locale)
(require 'coldnew-advice)

(require 'coldnew-core)

(require 'coldnew-buffer)
(require 'coldnew-build)
(require 'coldnew-commands)
(require 'coldnew-debug)
(require 'coldnew-editor)
(require 'coldnew-file)
(require 'coldnew-frame)
(require 'coldnew-git)
(require 'coldnew-irc)
(require 'coldnew-keybinding)
(require 'coldnew-mail)
(require 'coldnew-menu)
(require 'coldnew-minibuffer)
(require 'coldnew-modeline)
(require 'coldnew-theme)
(require 'coldnew-toolbar)
(require 'coldnew-window)
(require 'coldnew-fonts)
(require 'coldnew-locale)
(require 'coldnew-daemon)
(require 'coldnew-help)
(require 'coldnew-terminal)
(require 'coldnew-tabs)
(require 'coldnew-snippets)
(require 'coldnew-package)
(require 'coldnew-anything)
(require 'coldnew-backup)
(require 'coldnew-complete)
(require 'coldnew-session)
(require 'coldnew-time)
(require 'coldnew-dictionary)
;; Some extra setting that I dont't know how to sort it
(require 'coldnew-extra)


(require 'coldnew-lang-elisp)
(require 'coldnew-lang-ruby)
;;(require 'coldnew-lang-guile)
;;(require 'coldnew-lang-racket)
(require 'coldnew-lang-c)
(require 'coldnew-lang-newlisp)
(require 'coldnew-lang-scheme)
;;(require 'coldnew-lang-python)
(require 'coldnew-lang-octave)




(provide 'coldnew-init)
;; coldnew-init.el ends here.