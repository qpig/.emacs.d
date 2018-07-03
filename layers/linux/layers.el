(configuration-layer/declare-layers '(
                                      emacs-lisp
                                      (c-c++ :variables
                                             c-c++-enable-c++11 t
                                             c-c++-enable-rtags-support 'no-completion
                                             c-c++-default-mode-for-headers 'c++-mode
                                             rtags-jump-to-first-match nil)
                                      (auto-completion :variables
                                                       auto-completion-return-key-behavior 'complete
                                                       auto-completion-tab-key-behavior 'cycle
                                                       auto-completion-complete-with-key-sequence nil
                                                       auto-completion-complete-with-key-sequence-delay 0.1
                                                       auto-completion-idle-delay 0.2
                                                       auto-completion-enable-help-tooltip t
                                                       auto-completion-private-snippets-directory nil)
                                      (syntax-checking :variables syntax-checking-enable-by-default nil)
                                      org

                                      (version-control :variables version-control-diff-side 'left)

                                      (ranger :variables
                                              ranger-cleanup-eagerly t
                                              ranger-show-preview t
                                              ranger-cleanup-on-disable t
                                              ranger-show-hidden t)
                                      (git :variables git-magit-status-fullscreen t)
                                      smex

                                      (perforce)
                                      (command-log)
                                      ))
