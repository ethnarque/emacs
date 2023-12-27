(use-package company
  :config
  (global-company-mode)
  (setq company-idle-delay 0)
  :bind
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("C-h" . backward-delete-char)
        ("tab" . company-complete-selection)))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package lsp-mode)

(provide 'init-company)
