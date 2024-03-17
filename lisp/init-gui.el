;;; init-gui.el --- Managing GUI related settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq inhibit-startup-screen t)

(setq-default window-resize-pixelwise t
	      frame-resize-pixelwise t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(menu-bar-mode -1)

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))


(use-package all-the-icons)

;; System specific tweeks
(let ((font-name "Iosevka SS05"))
  (if (eq system-type 'darwin)
      (progn
        (set-frame-font (format "%s-14" font-name) nil t)
        (setq-default ns-use-thin-smoothing t
                      ns-use-mwheel-momentum t)
        (add-to-list 'default-frame-alist '(undecorated-round .t)))
    (progn
      (set-frame-font (format "%s-14" font-name) nil t))))


(use-package modus-themes
  :ensure t
  :config
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil)

  ;; Maybe define some palette overrides, such as by using our presets
  (setq modus-themes-common-palette-overrides
        modus-themes-preset-overrides-faint)

  (mapc #'disable-theme custom-enabled-themes)
  ;; Load the theme of your choice.
  ;; (load-theme 'modus-operandi :no-confirm)
  (when (eq system-type 'darwin)
    (defun secretaire/apply-theme (appearance)
      "Load theme, taking current system APPEARANCE into consideration."
      (mapc #'disable-theme custom-enabled-themes)
      (pcase appearance
        ('light (load-theme 'modus-operandi t))
        ('dark (load-theme 'modus-vivendi t))))
    (add-hook 'ns-system-appearance-change-functions #'secretaire/apply-theme))

  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))


;;; Ligatures
(use-package ligature
  :hook (prog-mode . global-ligature-mode)
  :init
  ;; Enable ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                       ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                       "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                       "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                       "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                       "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                       "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                       "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                       "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                       "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%")))

(defun secretaire/frame-recenter (&optional frame)
  "This is a comment with FRAME."
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.5) (left . 0.5)))))

(defun secretaire/gui-startup-hook ()
  "This is my startup."
  (when (display-graphic-p)
    (set-frame-size (selected-frame) (floor(/ (* (x-display-pixel-width) 0.5) 10)) 50)
    (secretaire/frame-recenter (selected-frame))))

(add-hook 'emacs-startup-hook 'secretaire/gui-startup-hook)
;;; init-gui.el ends here
