;; mozc setting
(require 'mozc)
;; (set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

(define-minor-mode overriding-minor-mode
  "強制的にC-SPCを割り当てる"             ;説明文字列
  t                                     ;デフォルトで有効にする
  ""                                    ;モードラインに表示しない
  `((,(kbd "C-SPC") . toggle-input-method))
  `((,(kbd "<zenkaku-hankaku>") . toggle-input-method)))
(require 'mozc-popup)
(setq mozc-candidate-style 'popup) ; select popup style.

;; OSのIME無効化
;; (defun my/eisuu-key ()
;;   (interactive)
;;   (call-process "osascript" nil t nil "-e" "tell application \"System Events\" to key code 102"))
;; (add-hook 'focus-in-hook 'my/eisuu-key)

;; ;; -------------------------------------------------------
;; ;; 日本語入力時(mozc-mode) にも自前のコマンドを割り当てる
;; ;; -------------------------------------------------------
;; (add-hook 'mozc-mode-hook
;;   (lambda()
;;     (define-key mozc-mode-map (kbd "C-a") 'my-move-beginning-of-line)
;;     (define-key mozc-mode-map (kbd "C-e") 'my-end-of-line)
;;     ))

;; 入力モードでカーソルの色を変える
(add-hook 'input-method-activate-hook
          (lambda() (set-cursor-color "blue")))
(add-hook 'input-method-inactivate-hook
          (lambda() (set-cursor-color "white")))

;; grep ショートカット
(global-set-key (kbd "C-f") 'grep-find)

;; 拡張子ごとにテンプレートを挿入
(require 'autoinsert)
(setq auto-insert-query nil) ;; 確認をしない
(setq auto-insert-directory "~/.emacs.d/insert/") ;; テンプレートディレクトリ指定
(setq auto-insert-alist
      ;; 拡張仕ごとにファイルを指定
      (append '(
                ("\\.py" . "python-insert.py")
               ) auto-insert-alist))

(add-hook 'find-file-hooks 'auto-insert)

;; ;; パスの共有
;; ;; PATH initialization
;; (when window-system
;;   (require 'exec-path-from-shell)
;;   (exec-path-from-shell-initialize))


;; (defun hogehoge ()
;;   (interactive)
;;   (y-or-n-p "Do you need a lift? ")
;;   )

;; (hogehoge)


(require 'notifications)
(notifications-notify
 :title "Emacs"
 :body  "I &#9825; vim"
 :timeout 10000)

;; (notifications-notify
;;  :title "org-pomodoro"
;;  :body "Well done! Take a break."
;;  :app-icon "~/.emacs.d/img/004-beer.png"))

