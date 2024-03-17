;;; init-keybinds --- comment -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package which-key
  :diminish t
  :hook (after-init . which-key-mode)
  :init
  (setq-default which-key-idle-delay 1.5))

;;; init-keybinds.el ends here
