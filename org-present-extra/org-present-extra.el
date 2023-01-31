;;; org-present-extra --- Some extras to make org mode nicer to look at
;;; Commentary:
;;;  Lots of face hacking that can be toggled

;;; Code:

(require 'org)
(require 'org-faces)

(defcustom org-present-extra-default
  '(:height 2.0)
  "Default face re-mapping."
  :group 'org-present-extra)

(defcustom org-present-extra-header
  '(:height 1.5)
  "Header line face re-mapping."
  :group 'org-present-extra)

(defcustom org-present-extra-document-title
  '(:height 1.5)
  "Document title face re-mapping."
  :group 'org-present-extra)

(defcustom org-present-extra-code
  '(:height 2.0)
  "Code block face re-mapping."
  :group 'org-present-extra)

(defcustom org-present-extra-verbatim
  '(:height 1.5)
  "Verbatim block face remapping."
  :group 'org-present-extra)

(defcustom org-present-extra-block
  '(:height 1.25)
  "Block face remapping."
  :group 'org-present-extra)

(defcustom org-present-extra-block-begin-line
  '(:height 0.5)
  "Block begin line face remapping."
  :group 'org-present-extra)

(defcustom org-present-extra-level-1
  '(:height 1.7)
  "Org-level-1 face remapping."
  :group 'org-present-extra)

(defcustom org-present-extra-level-2
  '(:height 1.5)
  "Org-level-2 face remapping."
  :group 'org-present-extra)

(defcustom org-present-extra-level-3
  '(:height 1.25)
  "Org-level-3 face remapping."
  :group 'org-present-extra)


;;;###autoload
(defun org-present-extra-start ()
  "Enter org presentation mode."
  (interactive)
  (xtra/hide-org-block-markers)
  (xtra/remap-org-faces)
  (org-present-prettify))

;;;###autoload
(defun org-present-extra-end ()
  "Leave org presentation mode."
  (interactive)
  (xtra/show-org-block-markers)
  (xtra/reset-org-faces)
  (org-present-normalize))

;;;###autoload
(defun org-present-prettify ()
  "Hide or show the stuff depending on ARG."
  (interactive)
  (setq-local org-hide-emphasis-markers t
              org-pretty-entities t
              org-hide-leading-stars t
              org-startup-with-latex-preview t
              org-startup-with-inline-images t)
  (font-lock-update))

;;;###autoload
(defun org-present-normalize ()
  "Hide or show the stuff depending on ARG."
  (interactive)
  (setq-local org-hide-emphasis-markers nil
              org-pretty-entities nil
              org-hide-leading-stars nil
              org-startup-with-latex-preview nil
              org-startup-with-inline-images nil)
  (font-lock-update))

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

(defvar-local xtra-org-default-cookie nil)
(defvar-local xtra-header-cookie nil)
(defvar-local xtra-org-document-title-cookie nil)
(defvar-local xtra-org-code-cookie nil)
(defvar-local xtra-org-verbatim-cookie nil)
(defvar-local xtra-org-block-cookie nil)
(defvar-local xtra-org-block-begin-line-cookie nil)
(defvar-local xtra-org-level-1-cookie nil)
(defvar-local xtra-org-level-2-cookie nil)
(defvar-local xtra-org-level-3-cookie nil)


(defun xtra/remap-org-faces ()
  "Remap org mode faces from customised values."
  (setq
   xtra-org-default-cookie
   (face-remap-add-relative 'default org-present-extra-default)

   xtra-header-cookie
   (face-remap-add-relative 'header-line org-present-extra-header)

   xtra-org-document-title-cookie
   (face-remap-add-relative 'org-document-title org-present-extra-document-title)

   xtra-org-code-cookie
   (face-remap-add-relative 'org-code org-present-extra-code)

   xtra-org-verbatim-cookie
   (face-remap-add-relative 'org-verbatim org-present-extra-verbatim)

   xtra-org-block-cookie
   (face-remap-add-relative 'org-block org-present-extra-block)

   xtra-org-level-1-cookie
   (face-remap-add-relative 'org-level-1 org-present-extra-level-1)

   xtra-org-level-2-cookie
   (face-remap-add-relative 'org-level-2 org-present-extra-level-2)

   xtra-org-level-3-cookie
   (face-remap-add-relative 'org-level-3 org-present-extra-level-3)

   xtra-org-block-begin-line-cookie
   (face-remap-add-relative 'org-block-begin-line org-present-extra-block)))



(defun xtra/reset-org-faces ()
  "Reset org mode faces."
  (face-remap-remove-relative xtra-org-default-cookie)
  (face-remap-remove-relative xtra-header-cookie)
  (face-remap-remove-relative xtra-org-document-title-cookie)
  (face-remap-remove-relative xtra-org-code-cookie)
  (face-remap-remove-relative xtra-org-verbatim-cookie)
  (face-remap-remove-relative xtra-org-block-cookie)

  (face-remap-remove-relative xtra-org-level-1-cookie)
  (face-remap-remove-relative xtra-org-level-2-cookie)
  (face-remap-remove-relative xtra-org-level-3-cookie)
  
  (face-remap-remove-relative xtra-org-block-begin-line-cookie))

(provide 'org-present-extra)
;;; org-present-extra.el ends here
