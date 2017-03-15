(configuration-layer/declare-layers '(
                                      emacs-lisp
                                      c-c++
                                      (auto-completion :variables
                                                       auto-completion-return-key-behavior 'complete
                                                       auto-completion-tab-key-behavior nil
                                                       auto-completion-complete-with-key-sequence nil
                                                       auto-completion-complete-with-key-sequence-delay 0.1
                                                       auto-completion-enable-help-tooltip t
                                                       auto-completion-private-snippets-directory nil)
                                      syntax-checking
                                      ;; spell-checking
                                      org

                                      version-control

                                      ;; something I know
                                      (ranger :variables ranger-cleanup-eagerly t)
                                      gtags
                                      (git :variables git-magit-status-fullscreen t)
                                      smex
                                      (ibuffer :variables ibuffer-group-buffers-by 'projects)
                                      ))
