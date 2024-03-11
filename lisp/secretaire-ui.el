;;; secretaire-ui --- Icons and fonts configuration
;;; Code:
;;; Commentary:

(let ((font-family "IBM Plex Mono"))
  (when (find-font (font-spec :family font-family))
    (cond
     ((eq system-type 'darwin) (set-frame-font (concat font-family "-13") nil t))
     ((eq system-type 'gnu/linux) (set-frame-font (concat font-family "-11") nil t)))))

(use-package nerd-icons
  :commands (nerd-icons-octicon
             nerd-icons-faicon
             nerd-icons-flicon
             nerd-icons-wicon
             nerd-icons-mdicon
             nerd-icons-codicon
             nerd-icons-devicon
             nerd-icons-ipsicon
             nerd-icons-pomicon
             nerd-icons-powerline))

(provide 'secretaire-ui)
;;; secretaire-ui.el ends here.
