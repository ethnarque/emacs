;;; theme --- Summary
;;; Commentary:
;;; Code:

(when (find-font (font-spec :family "Iosevka"))
  (cond
   ((eq system-type 'darwin) (set-frame-font "Iosevka-14" nil t))
   ((eq system-type 'gnu/linux) (set-frame-font "Iosevka-12" nil t))))

(use-package all-the-icons)

(use-package doom-modeline 
:init (doom-modeline-mode 1))

(use-package modus-themes
  :config (modus-themes-select 'modus-vivendi))

(provide 'secretaire-theme)
;;; secretaire-theme.el ends here.
