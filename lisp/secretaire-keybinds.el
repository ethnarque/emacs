;;; secretaire-keybinds --- default for keybinds
;;; Commentary:
;;;
;;; Code:

(use-package which-key
  :hook (secretaire-first-input . which-key-mode)
  :init
  (setq which-key-sort-order #'which-key-key-order-alpha
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10)
  :config
  (put 'which-key-replacement-alist 'initial-value which-key-replacement-alist)
  
)

(provide 'secretaire-keybinds)
;;; secretaire-keybinds.el ends here
