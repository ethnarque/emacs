;;; checkers/syntax --- Summary
;;; Commentary:
;;; Code:

(defun syntax-init-popups-h ()
  "Activate `flycheck-posframe-mode' if available and in GUI Emacs.
Activate `flycheck-popup-tip-mode' otherwise.
Do nothing if `lsp-ui-mode' is active and `lsp-ui-sideline-enable' is non-nil."
  (unless (and (bound-and-true-p lsp-ui-mode)
               lsp-ui-sideline-enable)
    (if (and (fboundp 'flycheck-posframe-mode)
             (display-graphic-p))
        (flycheck-posframe-mode +1)
      (flycheck-popup-tip-mode +1))))


(use-package flycheck
  :unless (module-function-p 'flymake)
  :commands flycheck-list-errors flycheck-buffer
  :hook (secretaire-first-buffer . global-flycheck-mode)
  :config
  (setq-default flycheck-emacs-lisp-load-path 'inherit)

  (setq flycheck-idle-change-delay 1.0
        flycheck-buffer-switch-check-intermediate-buffers t
        flycheck-display-errors-delay 0.25))


(use-package flycheck-popup-tip
  :unless (module-function-p 'flymake)
  :commands flycheck-popup-tip-show-popup flycheck-popup-tip-delete-popup
  :hook (flycheck-mode . syntax-init-popups-h)
  :config
  (setq flycheck-popup-tip-error-prefix "X ")
  (if (module-function-p 'evil)
      (add-hook 'evil-insert-state-entry-hook #'flycheck-popup-tip-delete-popup)
      (add-hook 'evil-replace-state-entry-hook #'flycheck-popup-tip-delete-popup)))


(use-package flymake
  ;;:when (module-function-p 'child-frame)
  :defer t
  :init
  (add-hook 'prog-mode #'flymake-mode)
  (add-hook 'text-mode #'flymake-mode)
  :config
  (setq elisp-flymake-byte-compile-load-path load-path
        flymake-fringe-indicator-position 'right-fringe))


(use-package flymake-popon
  :unless (module-function-p 'flymake)
  :hook (flymake-mode . flymake-popon-mode))


(provide 'init-flycheck)
;;; init-flycheck.el ends here
