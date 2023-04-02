;;; org-agenda-extra --- Some extras to make it work like I want
;;; Commentary:
;;;  Org-agenda-files need some hack

;;; Code:

(require 'org-agenda)


(defcustom org-agenda-extra-directories
  '("")
  "A list of directories to recurse for org files to scan."
  :type '(repeat directory)
  :group 'org-agenda-extra)


;; org-agenda-files: TODO need to create an additional package to manage this

(defun org-files-recursively (dirlist)
  "Get all .org files in folders in DIRLIST."
  (mapcan
   #'(lambda (dir)
       (directory-files-recursively dir (rx (seq ".org" line-end))))
   dirlist))

;;;###autoload
(defun org-agenda-extra--get-agenda-files ()
  "Set the agenda files."
  (interactive)
  (let ((files (org-files-recursively org-agenda-extra-directories)))
    (setq org-agenda-files files)
    (org-agenda-redo-all)
    ))

(provide 'org-agenda-extra)
;;; org-agenda-extra.el ends here
