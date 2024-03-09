;;; secretaire-lib --- Summary
;;; Commentary:
;;; Code:
(defcustom secretaire-first-input-hook ()
  "Transient hooks run before the first user input."
  :type 'hook
  :local 'permanent-local
  :group 'secretaire)

;; Add a function to run on the first input
(defun secretaire-run-on-first-input ()
  "Function to run on the first user input."
  (when (and (not (boundp 'secretaire-first-input-triggered))
             (run-hook-with-args-until-success 'secretaire-first-input-hook))
    (setq-default secretaire-first-input-triggered t)))

(add-hook 'pre-command-hook 'secretaire-run-on-first-input)

(defcustom secretaire-first-buffer-hook ()
   "Transient hooks run before the first interactively opened buffer."
   :type 'hook
   :local 'permanent-local
   :group 'secretaire)

(defun secretaire-run-on-first-buffer ()
  "Function to run on the first interactively opened buffer."
  (when (and (not (boundp 'secretaire-first-buffer-triggered))
             (run-hook-with-args-until-success 'secretaire-first-buffer-hook))
    (setq-default secretaire-first-buffer-triggered t)))

(add-hook 'find-file-hook 'secretaire-run-on-first-buffer)

(provide 'secretaire-lib)
;;; secretaire-lib.el ends here.
