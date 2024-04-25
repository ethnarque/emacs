;;; ethnarque-dark-theme.el --- ethnarque-dark
;;; Version: 1.0
;;; Commentary:
;;; A theme called ethnarque-dark
;;; Code:

(deftheme ethnarque-dark "DOCSTRING for ethnarque-dark.")
  (custom-theme-set-faces 'ethnarque-dark
   '(default ((t (:foreground "#b9b9b9" :background "#161616" ))))
   '(cursor ((t (:background "#b9b9b9" ))))
   '(mode-line ((t (:foreground "#282828" :background "#7c6f64" ))))
   '(region ((t (:background "#b9b9b9" :foreground "#161616" ))))
   '(secondary-selection ((t (:background "#d9d9d9" ))))
   '(font-lock-builtin-face ((t (:foreground "#8e8e8e" ))))
   '(font-lock-constant-face ((t (:foreground "#999999" ))))
   '(font-lock-comment-face ((t (:foreground "#525252" :slant italic ))))
   '(font-lock-doc-face ((t (:foreground "#525252" :slant italic ))))
   '(font-lock-function-name-face ((t (:inherit font-lock-variable-name-face ))))
   '(font-lock-keyword-face ((t (:foreground "#7c7c7c" ))))
   '(font-lock-string-face ((t (:foreground "#8a9dcd" ))))
   '(font-lock-type-face ((t (:foreground "#a0a0a0" ))))
   '(show-paren-match ((t (:foreground "#b9b9b9" :bold t ))))
   '(font-lock-variable-name-face ((t (:foreground "#ababab" ))))
   '(font-lock-punctuation-face ((t (:foreground "#7c7c7c" ))))
   '(minibuffer-prompt ((t (:foreground "#b9b9b9" :bold t ))))
   '(font-lock-warning-face ((t (:inherit font-lock-constant-face :bold t ))))
   '(hl-line ((t (:background "#252525" ))))
   '(line-number ((t (:foreground "#525252"))))
   '(line-number-current-line ((t (:background "#242424" :foreground "#ababab"))))
   '(vertical-border ((t (:background "#161616" :foreground "#464646" ))))
   '(fringe ((t (:background nil ))))


   ;;; ELisp
   '(rainbow-delimiters-depth-1-face ((t (:foreground "#7c7c7c" ))))
   '(rainbow-delimiters-depth-2-face ((t (:foreground "#7c7c7c" ))))
   '(rainbow-delimiters-depth-3-face ((t (:foreground "#7c7c7c" ))))
   '(rainbow-delimiters-depth-4-face ((t (:foreground "#7c7c7c" ))))
   '(rainbow-delimiters-depth-5-face ((t (:foreground "#7c7c7c" ))))
   '(rainbow-delimiters-depth-6-face ((t (:foreground "#7c7c7c" ))))
   '(rainbow-delimiters-depth-7-face ((t (:foreground "#7c7c7c" ))))
   '(rainbow-delimiters-depth-8-face ((t (:foreground "#7c7c7c" ))))
   '(rainbow-delimiters-depth-9-face ((t (:foreground "#7c7c7c" )))))

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'ethnarque-dark)

;;; ethnarque-dark-theme.el ends here
