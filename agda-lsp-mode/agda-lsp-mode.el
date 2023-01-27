;;; package -- Summary: lsp-mode client defs for Agda
;;; Commentary:
;;; Register an lsp-mode client for agda2-mode and als server
;;; Code:

(require 'lsp-mode)

(add-to-list 'lsp-language-id-configuration '(agda2-mode . "agda"))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection "als")
                  :major-modes '(agda2-mode)
                  :activation-fn (lsp-activate-on "agda")
                  :server-id 'als))

(provide 'agda-lsp-mode)
;;; agda-lsp-mode.el ends here
