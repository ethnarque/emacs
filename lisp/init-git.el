(use-package magit
  :diminish t
  :custom
  (magic-display-buffer-function #'magic-display-buffer-same-swindow-except-diff-v1))

(use-package forge)

(provide 'init-git)
