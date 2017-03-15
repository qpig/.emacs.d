(configuration-layer/declare-layers '(
                                      emacs-lisp
                                      ;; (c-c++ :variables c-c++-enable-clang-support t)
                                      c-c++
                                      (auto-completion :variables
                                                       auto-completion-return-key-behavior 'complete
                                                       auto-completion-tab-key-behavior nil
                                                       auto-completion-complete-with-key-sequence nil
                                                       auto-completion-complete-with-key-sequence-delay 0.1
                                                       auto-completion-enable-help-tooltip t
                                                       auto-completion-private-snippets-directory nil)
                                      github
                                      syntax-checking
                                      ;; spell-checking
                                      org

                                      version-control

                                      ;; something I know
                                      dash
                                      osx
                                      (ranger :variables ranger-cleanup-eagerly t)
                                      ;; gtags ;; replace with rtags
                                      (git :variables git-magit-status-fullscreen t)
                                      command-log
                                      smex
                                      (ibuffer :variables ibuffer-group-buffers-by 'projects)
                                      (colors :variables colors-enable-nyan-cat-progress-bar t) ;; just for cat
                                      ))
