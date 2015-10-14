;;; packages.el --- youdao Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq youdao-packages
    '(
      youdao-dictionary
      ;; package names go here
      ))

;; List of packages to exclude.
(setq youdao-excluded-packages '())

;; For each package, define a function youdao/init-<package-name>
;;
;; (defun youdao/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun youdao/init-youdao-dictionary ()
  (evil-leader/set-key "oy" 'youdao-dictionary-search-at-point+)
  (evil-leader/set-key "oo" 'youdao-dictionary-play-voice-at-point))
