
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
(eval-after-load "enriched"
    '(defun enriched-decode-display-prop (start end &optional param)
       (list start end)))

;; 初期設定

;; window system type of terminal
(when (equal window-system nil)
  (set-terminal-parameter nil 'background-mode 'dark)
  (load-file "~/.emacs.d/system/common.el"))

(if window-system (progn

;; OS type of linux
(when (equal system-type 'gnu/linux)
  (load-file "~/.emacs.d/system/common.el")
  (load-file "~/.emacs.d/window/x11.el")
  (load-file "~/.emacs.d/system/gnu_linux.el"))

;; OS type of windows
(when (equal system-type 'windows-nt)
  (load-file "~/.emacs.d/system/common.el")
  (load-file "~/.emacs.d/system/windows-nt.el")
  (load-file "~/.emacs.d/window/x11.el"))
))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(init-loader-show-log-after-init (quote error-only))
 '(package-selected-packages
   (quote
    (yatex yaml-mode undo-tree tabbar swap-buffers popwin perspective neotree init-loader google-translate flycheck ac-math)))
 '(safe-local-variable-values
   (quote
    ((mode . japanese-latex)
     (TeX-master . t)
     (TeX-master . main)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
