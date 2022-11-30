;;; org-present-extra --- Some extras to make org mode nicer to look at
;;; Commentary:
;;;  Lots of font and variable hacking that can be toggled

;;; Code:
;; add this in whatever package hooks (with-eval-after-load "org-tree-slide"
;;  (add-hook 'org-tree-slide-play-hook 'my-toggle-org-meta-line)
 ;; (add-hook 'org-tree-slide-stop-hook 'my-toggle-org-meta-line))
(require 'org)
(require 'org-faces)

(defcustom org-present-extra-default
  '(default :height 1.5)
  "Default."
  :group 'org-present-extra)

;;;###autoload
(defun org-present-extra-start ()
  "Enter org presentation mode."
  (interactive)
  (set-variable 'org-hide-emphasis-markers t)
  (xtra/hide-org-block-markers)
  (xtra/resize-org-faces)
  (org-mode-restart))

;;;###autoload
(defun org-present-extra-end ()
  "Leave org presentation mode."
  (interactive)
  (set-variable 'org-hide-emphasis-markers nil)
  (xtra/show-org-block-markers)
  (xtra/reset-org-faces)
  (org-mode-restart))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;; turn and face the change...


(defvar-local xtra-default-cookie nil)
(defvar-local xtra-header-cookie nil)
(defvar-local xtra-org-document-title-cookie nil)
(defvar-local xtra-org-code-cookie nil)
(defvar-local xtra-org-verbatim-cookie nil)
(defvar-local xtra-org-block-cookie nil)
(defvar-local xtra-org-block-begin-line-cookie nil)

(defun xtra/resize-org-faces ()
  "Tweak org mode faces - YMMV."
  (setq-local
   xtra-default-cookie
   (face-remap-add-relative 'default org-present-extra-default)))

(defun xtra/reset-org-faces ()
  "Reset org mode faces."
  (face-remap-remove-relative xtra-default-cookie))



;   '((default (:height 1.5) default)
;     (header-line (:height 5.0) header-line)
;     (org-document-title (:height 5.0) org-document-title)
;     (org-code (:height 1.5) org-code)
;     (org-verbatim (:height 1.5) org-verbatim)
;     (org-block (:height 1.25) org-block)
;     (org-block-begin-line (:height 0.5) org-block-begin-line))))


(provide 'org-present-extra)
;;; org-present-extra.el ends here
