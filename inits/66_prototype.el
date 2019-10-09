;; 取り扱い説明の表示
(defun document-road ()
  (interactive)
  (kill-scratch-buffer)
  (create-scratch-buffer)
  (set-buffer (get-buffer-create "*scratch*"))
  (funcall initial-major-mode)
  (insert-file-contents "~/.emacs.d/.scratch/doc" nil nil nil t))

(global-set-key (kbd "C-c h") 'document-road)


(defun kill-scratch-buffer ()
      ;; The next line is just in case someone calls this manually
      (set-buffer (get-buffer-create "*scratch*"))
      ;; Kill the current (*scratch*) buffer
      (remove-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
      (kill-buffer (current-buffer))
      ;; Make a brand new *scratch* buffer
      (set-buffer (get-buffer-create "*scratch*"))
      (lisp-interaction-mode)
      (make-local-variable 'kill-buffer-query-functions)
      (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
      ;; Since we killed it, don't let caller do that.
      nil)

 (defun create-scratch-buffer nil
       "create a scratch buffer"
       (interactive)
       (switch-to-buffer (get-buffer-create "*scratch*"))
       (lisp-interaction-mode))

;; ==============================
;; 自作プログラム
;; ==============================
;; 外部スクリプトの読み込み
(defun cat-1line (path)
  (interactive "fFile: ")
  (let ((command (concat "~/.emacs.d/bin/platex2pdf.sh " path)))
    (insert (shell-command-to-string command))))

;;===============================
;; scratch
;;===============================
;; スクラッチの引継ぎ
;; (setq initial-scratch-message "")           ; とりあえず initial message を消す
;; (add-hook 'kill-emacs-hook 'scratch-save)   ; Emacs終了時に *scratch* を保存
;; (add-hook 'window-setup-hook 'scratch-resume); 起動時に.scratchを読み込み
;; ;;  window-setup-hook が最後に呼ばれるっぽい
;; ;;  @see info 38.1.1 Summary: Sequence of Actions at Startup
;; (add-hook 'kill-buffer-hook; *scratch* バッファで kill-buffer したら内容を保存
;;           (lambda ()
;;             (if (equal (buffer-name) "*scratch*") (scratch-save))))
;; (add-hook 'after-save-hook        ; *scratch*をファイル保存したら、*scratch*復帰
;;           (lambda ()
;;             (unless (get-buffer "*scratch*") (scratch-resume))))
;; (defun scratch-save ()
;;   (let ((buf (get-buffer "*scratch*")))
;;     (when buf
;;       (set-buffer buf)
;;       (write-file "~/.emacs.d/.scratch/scratch")
;;       (ignore-errors (kill-buffer ".scratch")))))

;; (defun scratch-resume ()
;;   "*scratch* を保存した内容で復帰する"
;;   (interactive)
;;   (set-buffer (get-buffer-create "*scratch*"))
;;   (funcall initial-major-mode)
;;   (insert-file-contents "~/.emacs.d/.scratch/scratch" nil nil nil t)
;; (ignore-errors (kill-bffer ".scratch")))


;; スクラッチの読み込み
(defun scratch-road (file)
  "*scratch* を保存した内容で復帰する"
  (interactive)
  (set-buffer (get-buffer-create "*scratch*"))
  (funcall initial-major-mode)
  (insert-file-contents (concat "~/.emacs.d/.scratch/" file) nil nil nil t))


;; ランダムにスクラッチを読み込み
(defun insert-tetosan ()
  (setq rad (random 2))
  (cond
   ((= rad 0) (scratch-road "asc1"))
   ((= rad 1) (scratch-road "asc2"))
   )
)
(insert-tetosan)
;;(add-hook 'window-setup-hook 'insert-tetosan); 起動時に.scratchを読み込み


;; MEMO
;; (defun foo3 (n)             ; foo3は1引数
;;     (interactive "nCount:") ; ミニバッファで読む
;;     (insert   (number-to-string (* 2 n))))
;; n はオプション文字



;; TeX テンプレートの表示 (未実装)
;; (defun document-road ()
;;   (interactive)
;;   (set-buffer (get-buffer-create "*scratch*"))
;;   (funcall initial-major-mode)
;;   (insert-file-contents "~/.emacs.d/.scratch/practice.tex" nil nil nil t))

;; (global-set-key (kbd "C-c q") 'document-road)


;; make コマンド (辿る版)
(defun py-make (D)
  (interactive "D")
  (async-shell-command (concatenate 'string "python ~/.emacs.d/.bin/pymake/pymake.py " D)))
(global-set-key [f12] 'py-make)


;; 論文チェック
(defun py-checkpaper (f)
  (interactive "f")
  ;;(insert (shell-command-to-string "pwd"))
  ;;(shell-command-to-string "python ~/.emacs.d/.python/CheckPaper/checkpaper.py"))
  ;;(message (shell-command-to-string (concatenate 'string "python ~/.emacs.d/.python/CheckPaper/checkpaper.py " f))))
  (async-shell-command (concatenate 'string "python ~/.emacs.d/.bin/checkpaper.py " f)))
(global-set-key (kbd "C-c v") 'py-checkpaper)

;; (defun my/get-curernt-path ()
;;     (if (equal major-mode 'dired-mode)
;; 	default-directory
;; 	(buffer-file-name)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;------------------------------------------
;; ;; デスクトップ通知を送る
;; (defvar notification-center-title "Emacs")

;; (defun notification-center (msg)
;;   (let ((tmpfile (make-temp-file "notification-center")))
;;    (with-temp-file tmpfile
;;      (insert
;;       (format "display notification \"%s\" with title \"%s\""
;;               msg notification-center-title)))
;;    (unless (zerop (call-process "osascript" tmpfile))
;;      (message "Failed: Call AppleScript"))
;;    (delete-file tmpfile)))

;; (notification-center "我が友「Emacs」")


;;-----------------------------------------------
;; ;; ファイル名を開いたときにそれを通知する
;; (defun my/find-file-hook ()
;;   (notification-center (format "Open '%s'" (buffer-name))))
;; (add-hook 'find-file-hook 'my/find-file-hook)



;; emacs起動終了hook
;; (add-hook 'emacs-startup-hook 'my-message)






;;
;; D&D カスタム
;;
;; ;; デフォルト
;; (require 'smart-dnd)
;; (add-hook
;;  'text-mode-hook
;;  (lambda ()
;;    (smart-dnd-setup
;;     '(
;;       ("\\.tex\\'" . "\\input{%r}\n")
;;       ("\\.cls\\'" . "\\documentclass{%f}\n")
;;       ("\\.sty\\'" . "\\usepackage{%f}\n")
;;       ("\\.e?ps\\'"  . "\\includegraphics[width=1.0\\linewidth]{%f}\n")
;;       ("\\.pdf\\'"   . "\\includegraphics[]{%r}\n")
;;       ("\\.jpe?g\\'" . "\\includegraphics[width=1.0\\linewidth]{%f}\n")
;;       ("\\.png\\'"   . "\\includegraphics[width=1.0\\linewidth]{%f}\n")
;;       ))))

;; use-package 版
(use-package smart-dnd
  :commands (smart-dnd-setup)
  :init
  (add-hook
   'html-mode-hook
   (lambda ()
     (smart-dnd-setup
      '(
        ("\\.gif\\'" . "<img src=\"%R\">\n")
        ("\\.jpg\\'" . "<img src=\"%R\">\n")
        ("\\.png\\'" . "<txe src=\"%R\">\n")
        ("\\.css\\'" . "<link rel=\"stylesheet\" type=\"text/css\" href=\"%R\">\n" )
        ("\\.js\\'"  . "<script type=\"text/javascript\" src=\"%R\"></script>\n" )
        (".*" . "<a href=\"%R\">%f</a>\n")
        ))))
  (add-hook
   'text-mode-hook
   (lambda ()
     (smart-dnd-setup
      '(
        ("\\.tex\\'" . "\\input{%r}\n")
        ("\\.cls\\'" . "\\documentclass{%f}\n")
        ("\\.sty\\'" . "\\usepackage{%f}\n")
        ("\\.e?ps\\'"  . "\\includegraphics[width=1.0\\linewidth]{%f}\n")
        ("\\.pdf\\'"   . "\\includegraphics[]{%r}\n")
        ("\\.jpe?g\\'" . "\\includegraphics[width=1.0\\linewidth]{%f}\n")
        ("\\.png\\'"   . "\\includegraphics[width=1.0\\linewidth]{%f}\n")
        ))))
  )

