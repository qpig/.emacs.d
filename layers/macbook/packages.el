;;; packages.el --- macbook layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: qpig <qpig@qpigdeMacBook-Air.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `macbook-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `macbook/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `macbook/pre-init-PACKAGE' and/or
;;   `macbook/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst macbook-packages
  '(
    youdao-dictionary
    rtags
    )
  "The list of Lisp packages required by the macbook layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun macbook/init-youdao-dictionary ()
  (use-package youdao-dictionary
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
      (spacemacs/set-leader-keys "oo" 'youdao-dictionary-play-voice-at-point)
      )
    :config
    (progn
      ;; Enable Cache
      (setq url-automatic-caching t
            ;; Set file path for saving search history
            youdao-dictionary-search-history-file
            (concat spacemacs-cache-directory ".youdao")
            ;; Enable Chinese word segmentation support
            youdao-dictionary-use-chinese-word-segmentation t))))

(defun macbook/init-rtags ()
  (use-package rtags
    :defer t))

(defun macbook/post-init-rtags ()
  (require 'flycheck-rtags)
  (require 'rtags-helm)
  (setq rtags-use-helm t)

  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends-c-mode-common)
  (rtags-enable-standard-keybindings)
  (setq rtags-jump-to-first-match nil)
  (setq rtags-autostart-diagnostics t)


  (dolist (mode '(c-mode c++-mode))
    (evil-leader/set-key-for-mode mode
      "r ." 'rtags-find-symbol-at-point
      "r ," 'rtags-find-references-at-point
      "r v" 'rtags-find-virtuals-at-point
      "r V" 'rtags-print-enum-value-at-point
      "r /" 'rtags-find-all-references-at-point
      "r >" 'rtags-find-symbol
      "r <" 'rtags-find-references
      "r [" 'rtags-location-stack-back
      "r ]" 'rtags-location-stack-forward
      "r d" 'rtags-diagnostics
      "r g" 'rtags-guess-function-at-point
      "r p" 'rtags-set-current-project
      "r P" 'rtags-print-dependencies
      "r e" 'rtags-preprocess-file
      "r r" 'rtags-rename-symbol
      "r m" 'rtags-symbol-info
      "r s" 'rtags-display-summary
      "r ;" 'rtags-find-file
      "r f" 'rtags-fixit
      "r l" 'rtags-copy-and-print-current-location
      "r x" 'rtags-fix-fixit-at-point
      "r i" 'rtags-imenu
      "r h" 'rtags-print-class-hierarchy
      "r a" 'rtags-print-source-arguments))

  (define-key c-mode-base-map (kbd "M-[") (function rtags-location-stack-back))
  (define-key c-mode-base-map (kbd "M-]") (function rtags-location-stack-forward))

  (define-key global-map (kbd "M-[") (function rtags-location-stack-back))
  (define-key global-map (kbd "M-]") (function rtags-location-stack-forward))
  )
;;; packages.el ends here)
