;;; init-paredit.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package paredit
  :init
  (enable-paredit-mode))

(use-package puni
  :hook (prog-mode . puni-mode)
  :init
  )

(provide 'init-paredit)
;;; init-paredit.el ends here
