;;; org-present-xtra --- Some extras to make org mode nicer to look at
;;; Commentary:
;;;  Lots of font and variable hacking that can be toggled

;;; Code:
;; add this in whatever package hooks (with-eval-after-load "org-tree-slide"
;;  (add-hook 'org-tree-slide-play-hook 'my-toggle-org-meta-line)
 ;; (add-hook 'org-tree-slide-stop-hook 'my-toggle-org-meta-line))
(require 'org)
(require 'org-faces)

(defun xtra/org-present-start ()
  "Enter org presentation mode."
  (interactive)
  (set-variable 'org-hide-emphasis-markers t)
  (xtra/hide-org-block-markers)
  ;; (xtra/resize-org-faces)
  (org-mode-restart))

(defun xtra/org-present-end ()
  "Leave org presentation mode."
  (interactive)
  (set-variable 'org-hide-emphasis-markers nil)
  (xtra/show-org-block-markers)
  ;;(xtra/reset-org-faces)
  (org-mode-restart))

(defun xtra/hide-org-block-markers ()
  "Hide org mode block markers."
  ;; begin_ line
  (set-face-attribute
   'org-block-begin-line nil
   :foreground (face-attribute 'default :background)
   :background (face-attribute 'default :background))
  ;; end_ line
  (set-face-attribute
   'org-block-end-line nil
   :foreground (face-attribute 'default :background)
   :background (face-attribute 'default :background)))

(defun xtra/show-org-block-markers ()
  "Show the org mode block markers."
  (set-face-attribute
   'org-block-begin-line nil :foreground nil :background nil)
  (set-face-attribute
   'org-block-end-line nil :foreground nil :background nil))

;;; the following don't seem to work maybe some interaction
;;; with the org-slide?

(defun xtra/resize-org-faces ()
  "Tweak org mode faces - YMMV."
  (setq-local
   face-remapping-alist
   '((default (:height 1.5) default)
     (header-line (:height 5.0) header-line)
     (org-document-title (:height 5.0) org-document-title)
     (org-code (:height 1.5) org-code)
     (org-verbatim (:height 1.5) org-verbatim)
     (org-block (:height 1.25) org-block)
     (org-block-begin-line (:height 0.5) org-block-begin-line))))

(defun xtra/reset-org-faces ()
  "Reset org mode faces."
  (setq-local
   face-remapping-alist
   '((default varaible-pitch default))))
                

(provide 'org-present-xtra)
;;; org-present-xtra.el ends here
