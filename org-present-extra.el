;;; org-present-extra --- Some extras to make org mode nicer to look at
;;; Commentary:
;;;  Lots of font and variable hacking that can be toggled

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

;;;###autoload
(defun org-present-extra-start ()
  "Enter org presentation mode."
  (interactive)
  (set-variable 'org-hide-emphasis-markers t)
  (xtra/hide-org-block-markers)
  (xtra/remap-org-faces))

;;;###autoload
(defun org-present-extra-end ()
  "Leave org presentation mode."
  (interactive)
  (set-variable 'org-hide-emphasis-markers nil)
  (xtra/show-org-block-markers)
  (xtra/reset-org-faces)
  (org-mode-restart))

;;;###autoload
(defun org-present-hide-emphasis-markers (arg)
  "Hide or show the stuff depending on ARG."
  (interactive "P")
  ;; without a prefix hide the things
  (set-variable 'org-hide-emphasis-markers
                (if (null arg) t nil))
   ;; yes really!
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

(defvar-local xtra-org-default-cookie nil)
(defvar-local xtra-header-cookie nil)
(defvar-local xtra-org-document-title-cookie nil)
(defvar-local xtra-org-code-cookie nil)
(defvar-local xtra-org-verbatim-cookie nil)
(defvar-local xtra-org-block-cookie nil)
(defvar-local xtra-org-block-begin-line-cookie nil)

(defun xtra/set-the-default-face-attributes ()
  "This maybe works?"
  (interactive)
  (print org-present-extra-default)
  (face-remap-add-relative 'default org-present-extra-default))

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
  (face-remap-remove-relative xtra-org-block-begin-line-cookie))

(provide 'org-present-extra)
;;; org-present-extra.el ends here
