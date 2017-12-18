(setq org-confirm-babel-evaluate nil)


(add-hook 'c++-mode-hook 'clang-format-bindings)
(add-hook 'c-mode-hook 'clang-format-bindings)
(defun clang-format-bindings ()
  (define-key c++-mode-map [tab] 'clang-format-buffer))
