;;; init-minibuffer.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package vertico
  :hook (after-init . vertico-mode))

(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :bind(("C-x M-:" . consult-complex-command)
	("C-x b" . consult-buffer)
	("M-s r" . consult-ripgrep)))



(use-package marginalia
  :config
  (marginalia-mode))


(use-package consult)


(use-package embark
  :after vertico
  :hook (vertico-mode . embark-collect-mode)
  :init
  (with-eval-after-load 'vertico
    (bind-key "C-c C-o" 'embark-export)
    (bind-key "C-c C-c" 'embark-act)))

()

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))


(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
