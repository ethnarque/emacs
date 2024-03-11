;;; evil-ui --- Summary
;;; Code:
;;; Commentary:

(use-package evil
  :demand t
  :preface
  (setq evil-ex-search-vim-style-regexp t
        evil-mode-line-format 'nil
        evil-symbol-word-search t
        evil-normal-state-cursor 'box
        evil-insert-state-cursor 'bar
        evil-visual-state-cursor 'hollow))


(provide 'evil-config)
;;; evil-config.el ends here.
