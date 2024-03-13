;;; init-flymake.el --- Configure Flymake global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flymake
  :hook ((prog-mode . flymake-mode)
	 (text-mode . flymake-mode))
  :init
  (setq elisp-flymake-byte-compile-load-path load-path)
  (bind-key "C-c ! l " 'flymake-show-buffer-diagnostics)
  (bind-key "C-c ! n " 'flymake-goto-next-error)
  (bind-key "C-c ! p " 'flymake-goto-prev-error)
  (bind-key "C-c ! c " 'flymake-start))


(use-package flymake-flycheck
  :after flycheck
  :hook (flymake-mode . flymake-flycheck-auto)
  :init
  (with-eval-after-load 'flycheck
    (setq-default
     flycheck-disabled-checkers
     (append (default-value 'flycheck-disabled-checkers)
             '(emacs-lisp emacs-lisp-checkdoc emacs-lisp-package sh-shellcheck)))))

(provide 'init-flymake)
;;; init-flymake.el ends here
