;;;;
(provide 'init-undo-tree)

(when (require 'unod-tree nil 'noerror)
  (global-undo-tree-mode))
