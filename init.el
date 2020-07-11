
;; 構成  
;; ~/.emacs.d/
;;   ├ init.el             ; 初期設定
;;   ├ system
;;   │   ├ common.el      ; 共通の設定
;;   │   ├ gnu_linux.el   : Linux用の設定
;;   │   └ windows-nt.el  ; Windows用の設定
;;   └ window
;;        └ x11.el         ; 共通の設定(GUI)

;; 脆弱性対策

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(eval-after-load "enriched"
    '(defun enriched-decode-display-prop (start end &optional param)
       (list start end)))

;; 警告の抑制
(setq byte-compile-warnings
      '(not free-vars unresolved callargs redefine obsolete noruntime
            cl-functions interactive-only make-local))
;; (setq byte-compile-warnings '(not obsolete))
(setq ad-redefinition-action 'accept)

;; 初期設定

;; window system type of terminal
(when (equal window-system nil)
  (set-terminal-parameter nil 'background-mode 'dark)
  (load-file "~/.emacs.d/system/common/common.el"))

(if window-system (progn

;; OS type of linux
(when (equal system-type 'gnu/linux)
  (load-file "~/.emacs.d/system/common/common.el")
  (load-file "~/.emacs.d/window/x11.el")
  (load-file "~/.emacs.d/system/gnu_linux.el"))

;; OS type of windows
(when (equal system-type 'windows-nt)
  (load-file "~/.emacs.d/system/common/common.el")
  (load-file "~/.emacs.d/system/windows-nt.el")
  (load-file "~/.emacs.d/window/x11.el"))
))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-by-moving-to-trash t)
 '(doom-modeline-buffer-file-name-style (quote truncate-with-project) t)
 '(doom-modeline-icon t t)
 '(doom-modeline-major-mode-icon nil t)
 '(doom-modeline-minor-modes nil t)
 '(init-loader-show-log-after-init (quote error-only))
 '(package-selected-packages
   (quote
    (telephone-line smartparens 0blayout csharp-mode markdown-mode state yatex yaml-mode undo-tree tabbar swap-buffers popwin perspective neotree init-loader google-translate flycheck ac-math)))
 '(safe-local-variable-values
   (quote
    ((mode . japanese-latex)
     (TeX-master . t)
     (TeX-master . main))))
 '(shell-pop-default-directory "/Users/kyagi/git")
 '(shell-pop-full-span t)
 '(shell-pop-shell-type
   (quote
    ("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-position "right")
 '(shell-pop-window-size 30)
 '(trash-directory "~/.emacs.d/.cache/trash"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
