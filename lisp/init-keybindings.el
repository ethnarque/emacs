(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package general
  :config
  (general-evil-setup t)

  (general-create-definer plume-leader-def
  ;; :prefix my-leader
    :prefix "SPC"
    :global-prefix "C-SPC")
  ;; ** Global Keybindings
  (plume-leader-def
   :keymaps 'normal
   "t" '(:ignore t :which-key "toggles")
   "tt" '(counsel-load-theme :which-key "choose theme")
   ;; bind "SPC a"
   "a" 'org-agenda
   "b" 'counsel-bookmark
   "fb" 'counsel-switch-buffer
   "c" 'org-capture)
  ;; `general-create-definer' creates wrappers around `general-def', so
  ;; `evil-global-set-key'-like syntax is also supported
  (plume-leader-def 'normal
                    "a" 'org-agenda
                    "b" 'counsel-bookmark))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(provide 'init-keybindings)
