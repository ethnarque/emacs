;;; init-evil.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package evil
  :hook(after-init . evil-mode)
  :init
  (hl-line-mode +1)
  (add-hook 'evil-visual-state-entry-hook (lambda() (hl-line-mode -1)))
  (add-hook 'evil-visual-state-exit-hook (lambda() (hl-line-mode +1))))

(provide 'init-evil)
;;; init-evil.el ends here
