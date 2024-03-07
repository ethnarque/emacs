(when (find-font (font-spec :family "Iosevka")) 
  (set-frame-font "Iosevka-14" nil t))

(use-package all-the-icons)

(use-package doom-modeline 
:init (doom-modeline-mode 1))

(provide 'init-appearance)
