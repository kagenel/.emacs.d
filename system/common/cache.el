;; ----------------------
;; 自動作成ファイル
;; ----------------------
;; 削除ファイルを移動
(custom-set-variables
 '(delete-by-moving-to-trash t)
 '(trash-directory "~/.emacs.d/.cache/trash"))
;; backup の保存先
(setq backup-directory-alist
  (cons (cons ".*" (expand-file-name "~/.emacs.d/.cache/backup"))
        backup-directory-alist))
;; 自動保存ファイルの保存先
(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/.emacs.d/.cache/backup") t)))

;; auto-complete
(setq ac-comphist-file "~/.emacs.d/.cache/ac-comphist.dat")

;; ;; tramp
;; (setq tramp-persistency-file-name (my-set-history "tramp-" "~/.emacs.d/.cache"))
