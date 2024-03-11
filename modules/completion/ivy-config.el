;;; completion/ivy --- Summary
;;; Commentary:
;;; Code:

(use-package ivy
  :hook (secretaire-first-input . ivy-mode)
  :init
  (setq ivy-mode-map (make-sparse-keymap))
  :config
  (setq ivy-sort-max-size 7500)

  ;; Counsel changes a lot of ivy's state at startup; to control for that, we
  ;; need to load it as early as possible. Some packages (like `ivy-prescient')
  ;; require this.
  (require 'counsel nil t)

  (setq ivy-height 17
        ivy-wrap t
        ivy-fixed-height-minibuffer t
        ivy-read-action-function #'ivy-hydra-read-action
        ivy-read-action-format-function #'ivy-read-action-format-columns
        ;; don't show recent files in switch-buffer
        ivy-use-virtual-buffers nil
        ivy-virtual-abbreviate 'full
        ;; don't quit minibuffer on delete-error
        ivy-on-del-error-function #'ignoreq
        ;; enable ability to select prompt (alternative to `ivy-immediate-done')
        ivy-use-selectable-prompt t)
  
  (setf (alist-get 't ivy-hooks-alist)
        (lambda()
          (with-ivy-window
            (setq +ivy--origin (point-marker))))))

(use-package ivy-rich
  :after ivy
  :config
  (setq ivy-rich-parse-remove-buffer nil)

  (defun ivy-rich-bookmark-filename-or-empty (candidate)
    (let ((filename (ivy-rich-bookmark-filename candidate)))
      (if (not filename) "" filename)))

  (plist-put ivy-rich-display-transformers-list
             'counsel-describle-variable
              '(:columns
                ((counsel-describe-variable-transformer (:width 40)) ; the original transformer
                 (+ivy-rich-describe-variable-transformer (:width 50)) ; display variable value
                 (ivy-rich-counsel-variable-docstring (:face font-lock-doc-face)))))

  (plist-put ivy-rich-display-transformers-list
             'counsel-M-x
              '(:columns
                ((counsel-M-x-transformer (:width 60))
                 (ivy-rich-counsel-function-docstring (:face font-lock-doc-face)))))

  (plist-put ivy-rich-display-transformers-list
             'counsel-projectile-switch-to-buffer
              (plist-get ivy-rich-display-transformers-list 'ivy-switch-buffer))

  (plist-put ivy-rich-display-transformers-list
             'counsel-bookmark
              '(:columns
                ((ivy-rich-candidate (:width 0.5))
                 (ivy-rich-bookmark-filename-or-empty (:width 60)))))
  
  ;; Highlight buffers differently based on whether they're in the same project
  ;; as the current project or not.
  (when-let* ((plist (plist-get ivy-rich-display-transformers-list 'ivy-switch-buffer))
              (switch-buffer-alist (assq 'ivy-rich-candidate (plist-get plist :columns))))
    (setcar switch-buffer-alist '+ivy-rich-buffer-name))

  (nerd-icons-ivy-rich-mode +1)
  (ivy-rich-mode +1)
  (ivy-rich-project-root-cache-mode +1))

(use-package nerd-icons-ivy-rich
  :commands (nerd-icons-ivy-rich-mode)
  :after counsel-projectile)

(use-package counsel
  :defer t
  :config
  (when (featurep :system 'macos)
    (setq counsel-locate-cmd #'counsel-locate-cmd-mdfind)))

(use-package counsel-projectile
  :after ivy-rich
  :config
  (setq counsel-projectile-sort-files t))

(use-package wgrep
  :commands wgrep-change-to-wgrep-mode
  :config (setq-default wgrep-auto-save-buffer t))

(use-package ivy-avy
  :after ivy)

(use-package ivy-prescient
  :hook (ivy-mode . ivy-prescient-mode)
  :hook (ivy-prescient-mode . prescient-persist-mode)
  :commands +ivy-prescient-non-fuzzy
  :init
  (setq prescient-filter-method
        '(literal regexp initialism))
  :config
  ;; REVIEW Remove when radian-software/prescient.el#102 is resolved
  (add-to-list 'ivy-sort-functions-alist '(ivy-resume))
  (setq ivy-prescient-sort-commands
        '(:not swiper swiper-isearch ivy-switch-buffer lsp-ivy-workspace-symbol
          ivy-resume ivy--restore-session counsel-grep counsel-git-grep
          counsel-rg counsel-ag counsel-ack counsel-fzf counsel-pt counsel-imenu
          counsel-yank-pop counsel-recentf counsel-buffer-or-recentf
          counsel-outline counsel-org-goto counsel-jq)
        ivy-prescient-retain-classic-highlighting t)
  (defun +ivy-prescient-non-fuzzy (str)
    (let ((prescient-filter-method '(literal regexp)))
      (ivy-prescient-re-builder str)))

  ;; NOTE prescient config duplicated with `company'
  (setq prescient-save-file (concat user-emacs-directory "prescient-save.el")))


;;;###package swiper
(setq-default swiper-action-recenter t)

(provide 'ivy-config)
;;; ivy.el ends here
