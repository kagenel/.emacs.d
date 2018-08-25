
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

