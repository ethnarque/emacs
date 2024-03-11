;;; company --- Summary
;;; Commentary:
;;; Code:

;; (use-package company
;;   :hook (secretaire-first-input . global-company-mode)
;;   :disabled t
;;   :init
;;   (setq company-minimum-prefix-length 2
;;         company-tooltip-limit 7
;;         company-tooltip-align-annotations t
;;         company-require-match 'never
;;         company-global-modes
;;         '(not erc-mode
;;               circe-mode
;;               message-mode
;;               gud-mode
;;               vterm-mode)
;;         company-frontends
;;         '(company-pseudo-tooltip-frontend
;;           company-echo-metadata-frontend)
;; 
;;         company-backends '((company-files
;;                             company-keywords
;;                             company-capf
;;                             company-cmake
;;                             company-c-headers
;;                             company-dabbrev-code
;;                             company-semantic
;;                             company-gtags
;;                             company-etags
;;                             company-rtags
;;                             company-elisp)
;;                            (company-abbrev company-dabbrev))
;;         company-insertion-on-trigger nil)
;; 
;;   (setq-default company-dabbrev-other-buffers nil
;;                 company-idle-delay 0.5
;;                 company-dabbrev-downcase 0)
;; 
;;   ;;(add-hook 'global-company-mode-hook #'company-tng-mode)
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   :config
;;   ;; (add-hook 'company-mode-hook #'evil-normalize-keymaps)
;;   ;;(add-hook 'after-change-major-mode-hook #'+company-init-backends-h 'append)
;;   )
;; 
;; (use-package company-box
;;   :hook (company-mode . company-box-mode)
;;   :config
;;   (setq-default company-box-show-single-candidate t
;;                 company-box-backends-colors nil
;;                 company-box-tooltip-limit 50
;;                 company-box-icons-alist 'company-box-icons-nerd-icons
;;                 company-box-icons-nerd-icons
;;                 `((Unknown        . ,(nerd-icons-codicon  "nf-cod-code"                :face  'font-lock-warning-face))
;;                   (Text           . ,(nerd-icons-codicon  "nf-cod-text_size"           :face  'font-lock-doc-face))
;;                   (Method         . ,(nerd-icons-codicon  "nf-cod-symbol_method"       :face  'font-lock-function-name-face))
;;                   (Function       . ,(nerd-icons-codicon  "nf-cod-symbol_method"       :face  'font-lock-function-name-face))
;;                   (Constructor    . ,(nerd-icons-codicon  "nf-cod-triangle_right"      :face  'font-lock-function-name-face))
;;                   (Field          . ,(nerd-icons-codicon  "nf-cod-symbol_field"        :face  'font-lock-variable-name-face))
;;                   (Variable       . ,(nerd-icons-codicon  "nf-cod-symbol_variable"     :face  'font-lock-variable-name-face))
;;                   (Class          . ,(nerd-icons-codicon  "nf-cod-symbol_class"        :face  'font-lock-type-face))
;;                   (Interface      . ,(nerd-icons-codicon  "nf-cod-symbol_interface"    :face  'font-lock-type-face))
;;                   (Module         . ,(nerd-icons-codicon  "nf-cod-file_submodule"      :face  'font-lock-preprocessor-face))
;;                   (Property       . ,(nerd-icons-codicon  "nf-cod-symbol_property"     :face  'font-lock-variable-name-face))
;;                   (Unit           . ,(nerd-icons-codicon  "nf-cod-symbol_ruler"        :face  'font-lock-constant-face))
;;                   (Value          . ,(nerd-icons-codicon  "nf-cod-symbol_field"        :face  'font-lock-builtin-face))
;;                   (Enum           . ,(nerd-icons-codicon  "nf-cod-symbol_enum"         :face  'font-lock-builtin-face))
;;                   (Keyword        . ,(nerd-icons-codicon  "nf-cod-symbol_keyword"      :face  'font-lock-keyword-face))
;;                   (Snippet        . ,(nerd-icons-codicon  "nf-cod-symbol_snippet"      :face  'font-lock-string-face))
;;                   (Color          . ,(nerd-icons-codicon  "nf-cod-symbol_color"        :face  'success))
;;                   (File           . ,(nerd-icons-codicon  "nf-cod-symbol_file"         :face  'font-lock-string-face))
;;                   (Reference      . ,(nerd-icons-codicon  "nf-cod-references"          :face  'font-lock-variable-name-face))
;;                   (Folder         . ,(nerd-icons-codicon  "nf-cod-folder"              :face  'font-lock-variable-name-face))
;;                   (EnumMember     . ,(nerd-icons-codicon  "nf-cod-symbol_enum_member"  :face  'font-lock-builtin-face))
;;                   (Constant       . ,(nerd-icons-codicon  "nf-cod-symbol_constant"     :face  'font-lock-constant-face))
;;                   (Struct         . ,(nerd-icons-codicon  "nf-cod-symbol_structure"    :face  'font-lock-variable-name-face))
;;                   (Event          . ,(nerd-icons-codicon  "nf-cod-symbol_event"        :face  'font-lock-warning-face))
;;                   (Operator       . ,(nerd-icons-codicon  "nf-cod-symbol_operator"     :face  'font-lock-comment-delimiter-face))
;;                   (TypeParameter  . ,(nerd-icons-codicon  "nf-cod-list_unordered"      :face  'font-lock-type-face))
;;                   (Template       . ,(nerd-icons-codicon  "nf-cod-symbol_snippet"      :face  'font-lock-string-face))
;;                   (ElispFunction  . ,(nerd-icons-codicon  "nf-cod-symbol_method"       :face  'font-lock-function-name-face))
;;                   (ElispVariable  . ,(nerd-icons-codicon  "nf-cod-symbol_variable"     :face  'font-lock-variable-name-face))
;;                   (ElispFeature   . ,(nerd-icons-codicon  "nf-cod-globe"               :face  'font-lock-builtin-face))
;;                   (ElispFace      . ,(nerd-icons-codicon  "nf-cod-symbol_color"        :face  'success))))
;; 
;;   (setq-default x-gtk-resize-child-frames 'resize-mode)
;; 
;;   ;; Disable tab-bar in company-box child frames
;;   ;; TODO PR me upstream!
;;   (add-to-list 'company-box-frame-parameters '(tab-bar-lines . 0))
;; 
;;   ;; Don't show documentation in echo area, because company-box displays its own
;;   ;; in a child frame.
;;   (delq 'company-echo-metadata-frontend company-frontends))
;; 
;; (use-package company-dict
;;   :defer t
;;   :config
;;   (setq company-dict-dir (expand-file-name "dicts" user-emacs-directory))
;;   (add-hook 'doom-project-hook
;;     (defun +company-enable-project-dicts-h (mode &rest _)
;;       "Enable per-project dictionaries."
;;       (if (symbol-value mode)
;;           (add-to-list 'company-dict-minor-mode-list mode nil #'eq)
;;         (setq company-dict-minor-mode-list (delq mode company-dict-minor-mode-list))))))

(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode))
  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  (setq-local corfu-auto        t
              ;;corfu-auto-delay  0 ;; TOO SMALL - NOT RECOMMENDED
              ;;corfu-auto-prefix 1 ;; TOO SMALL - NOT RECOMMENDED
              ))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

(provide 'company-config)
;;; company-config.el ends here.
