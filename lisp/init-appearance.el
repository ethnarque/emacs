;; Fonts
(when (find-font (font-spec :family "Iosevka SS05"))
    (set-frame-font "Iosevka SS05-14" nil t))

;; Theme
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t)
  (doom-themes-treemacs-config)
  (doom-themes-org-config)
  :init
  (load-theme 'doom-opera t))

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1))
  ;;:custom ((doom-modeline-height 15))

(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'doom-opera-light t))
    ('dark (load-theme 'doom-opera t))))

(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)

(add-to-list 'default-frame-alist '(undecorated-round . t))

(provide 'init-appearance)
