;;; init-editing.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default blink-cursor-interval 0.4
	      bookmark-default-file (locate-user-emacs-file ".bookmarks.el")
	      buffers-menu-max-size 30
	      column-number-mode t
	      indent-tabs-mode nil
              require-final-newline nil
	      scroll-preserve-screen-position 'always
	      truncate-lines t
	      truncate-partial-width-windows nil)

(add-hook 'after-init-hook 'delete-selection-mode)

;; (add-hook 'after-init-hook 'global-auto-revert-mode)

(when (fboundp 'display-line-numbers-mode)
  (setq-default display-line-numbers-width 3)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))
(global-display-line-numbers-mode)

;; Show matching parens
(add-hook 'after-init-hook 'show-paren-mode)


;; Multiple cursors
(use-package multiple-cursors
  :init
  (bind-key "C-<" 'mc/mark-previous-like-this)
  (bind-key "C->" 'mc/mark-next-like-this)
  (bind-key "C-+" 'mc/mark-next-like-this)
  (bind-key "C-c C-<" 'mc/mark-all-like-this)
  (bind-key "C-M-<backspace>" 'kill-back-to-indentation))
;;; init-editing.el ends here
