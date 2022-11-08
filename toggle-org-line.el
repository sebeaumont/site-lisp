;; do this

(with-eval-after-load "org-tree-slide"
  (defvar my-hide-org-meta-line-p nil)

  (defun my-hide-org-meta-line ()
    (interactive)
    (setq my-hide-org-meta-line-p t)
    (set-face-attribute
     'org-block-begin-line nil
     :foreground (face-attribute 'default :background)
     :background (face-attribute 'default :background)
     )
    (set-face-attribute
     'org-block-end-line nil
     :foreground (face-attribute 'default :background)
     :background (face-attribute 'default :background)
     ))

  (defun my-show-org-meta-line ()
    (interactive)
    (setq my-hide-org-meta-line-p nil)
    (set-face-attribute
     'org-block-begin-line nil
     :foreground nil
     :background nil)
    (set-face-attribute
     'org-block-end-line nil
     :foreground nil
     :background nil))

  (defun my-toggle-org-meta-line ()
    (interactive)
    (if my-hide-org-meta-line-p
	(my-show-org-meta-line)
      (my-hide-org-meta-line)))

  (add-hook 'org-tree-slide-play-hook 'my-toggle-org-meta-line)
  (add-hook 'org-tree-slide-stop-hook 'my-toggle-org-meta-line))

