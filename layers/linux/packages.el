;;; packages.el --- linux layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: qpig <qpig@qpigdeLinux-Air.local>
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
;; added to `linux-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `linux/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `linux/pre-init-PACKAGE' and/or
;;   `linux/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq linux-packages
      '(
        youdao-dictionary
        ))

;; (defun linux/init-vhdl-tools ()
;;   (use-package vhdl-tools
;;     :defer t))

;; (defun linux/post-init-vhdl-tools ()
;;   (add-hook 'vhdl-mode-hook
;;             (lambda ()
;;               (vhdl-tools-mode 1)))
;;   (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil))

;;; packages.el ends here)
(defun linux/init-youdao-dictionary ()
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
