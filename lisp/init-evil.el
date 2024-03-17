;;; init-evil.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package evil
  :commands (evil-mode)
  :custom
  (evil-want-keybinding nil)
  :init
  (hl-line-mode +1)
  ;; Disable line hightlight in visual mode
  (add-hook 'evil-visual-state-entry-hook (lambda() (hl-line-mode -1)))
  (add-hook 'evil-visual-state-exit-hook (lambda() (hl-line-mode +1)))

  (evil-mode))

(use-package evil-collection
  :after evil
  :commands (evil-collection-init)
  :custom
  (setq evil-collection-setup-minibuffer t)
  :init
  (evil-collection-init))
;;; init-evil.el ends here
