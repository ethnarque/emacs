(defcustom secretaire-first-input-hook ()
  "Transient hooks run before the first user input"
  :type 'hook
  :local 'permanent-local
  :group 'secretaire)

;; Add a function to run on the first input
(defun secretaire-run-on-first-input ()
  "Function to run on the first user input."
  (when (and (not (boundp 'secretaire-first-input-triggered))
             (run-hook-with-args-until-success 'secretaire-first-input-hook))
    (setq secretaire-first-input-triggered t)))

;; Hook the function to the first-command-hook
(add-hook 'pre-command-hook 'secretaire-run-on-first-input)

(provide 'secretaire-lib)
