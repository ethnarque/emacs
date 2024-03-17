(defun secretaire/maybe-enable-envrc-global-mode ()
  "Enable `envrc-global-mode' if `direnv' is installed"
  (when (executable-find "direnv")
    (envrc-global-mode)))

(use-package envrc
  :hook (after-init . secretaire/maybe-enable-envrc-global-mode))
;;; init-envrc.el ends here.
