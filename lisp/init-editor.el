(dolist (mode '(org-mode-hook
                term-mode-hook
                neotree-mode-hook
                eshell-mode-hook))
  (add-hook mode(lambda () (display-line-numbers-mode 0))))

(provide 'init-editor)
