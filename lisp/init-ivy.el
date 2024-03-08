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
        ivy-use-selectable-prompt t))

  ;; Highlight each ivy candidate including the following newline, so that it
  ;; extends to the right edge of the window
  ;;(setf (alist-get 't ivy-format-functions-alist)
       ;; #'+ivy-format-function-line-or-arrow)

;; (use-package ivy-rich 
;;   :after ivy 
;;   :config 
;;   (setq ivy-rich-parse-remote-buffer nil)
;; 
;;   ;; Enhance the appearance of a couple counsel commands
;;   (dolist (enhance-counsel-list
;;            '(;; (counsel-M-x
;;              ;;  (:columns
;;              ;;   ((counsel-M-x-transformer (:width 60))
;;              ;;    (ivy-rich-counsel-function-docstring (:face font-lock-doc-face)))))
;; 
;;              (counsel-describe-variable
;;               (:columns
;;                ((counsel-describe-variable-transformer (:width 40))
;;                 (+ivy-rich-describe-variable-transformer (:width 50))
;;                 (ivy-rich-counsel-variable-docstring (:face font-lock-doc-face)))))
;; 
;;              (counsel-projectile-switch-to-buffer
;;               (plist-get ivy-rich-display-transformers-list 'ivy-switch-buffer))
;; 
;;              (counsel-bookmark
;;               (:columns
;;                ((ivy-rich-candidate (:width 0.5))
;;                 (ivy-rich-bookmark-filename (:width 60)))))))
;;   
;;   (let ((command (car enhance-counsel-list))
;;         (config (cdr enhance-counsel-list)))
;;     (plist-put ivy-rich-display-transformers-list command config)))
;;   
;;   ;; Highlight buffers differently based on whether they're in the same project
;;   ;; as the current project or not.
;;   (when-let* ((plist (plist-get ivy-rich-display-transformers-list 'ivy-switch-buffer))
;;               (switch-buffer-alist (assq 'ivy-rich-candidate (plist-get plist :columns))))
;;     (setcar switch-buffer-alist '+ivy-rich-buffer-name))
;; 
;;   ;; (nerd-icons-ivy-rich-mode +1)
;;   (ivy-rich-mode +1)
;;   (ivy-rich-project-root-cache-mode +1))
;;   ;; :custom (ivy-virtual-abbreviate 'full 
;;   ;;          ivy-rich-switch-buffer-align-virtual-buffer t 
;;   ;;          ivy-rich-path-style 'abbrev))
;; 
;; (use-package nerd-icons-ivy-rich
;;   :commands (nerd-icons-ivy-rich-mode)
;;   :after counsel-projectile)
;; 
;; (use-package counsel
;;   :defer t
;;   :init
;;   (define-key (current-global-map) [remap execute-extended-command] #'counsel-M-x))
;;   ;;:config
;; 
;; (use-package counsel-projectile 
;;   :after counsel 
;;   :config
;; (counsel-projectile-mode 1)

(provide 'init-ivy)
