;;; init-sessions.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package savehist
  :hook (after-init . savehist-mode)
  :init
  (setq-default history-length 1000)

  (setq-default session-save-file (locate-user-emacs-file ".session")
		session-name-disable-regexp "\\(?:\\`'/tmp\\|\\.git/[A-Z_]+\\'\\)"
		session-save-file-coding-system 'utf-8))


(provide 'init-sessions)
;;; init-sessions.el ends here
