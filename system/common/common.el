;; ##############################
;; load-pathの追加関数
;; ##############################
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; ##############################
;; パッケージ管理設定
;; ##############################
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)               ;; MELPAを追加
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t) ;; MELPA-stableを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)  ;; Marmaladeを追加
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)                    ;; Orgを追加
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize) ;; 初期化

;; ##############################
;;  自動インストール
;; ##############################
(require 'cl)
;; インストールするpackageを指定
(defvar my/packages
  '(
    use-package
    init-loader
    ;; magit
    ;; auto-complete
    ;; yaml-mode
    ))
;; インストールされていないpackagesをインストールする
(let ((not-installed (remove-if 'package-installed-p my/packages)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (package-install pkg))))

;; ##############################
;;  emacs バージョン管理
;; ##############################
(defvar is_emacs23 (and (>= emacs-major-version 23) (< emacs-major-version 24)))
(defvar is_emacs24 (and (>= emacs-major-version 24) (< emacs-major-version 25)))
(defvar is_emacs25 (and (>= emacs-major-version 25) (< emacs-major-version 26)))
(defvar is_emacs26 (and (>= emacs-major-version 26) (< emacs-major-version 27)))
(when is_emacs24
  (add-to-load-path "site-lisp")
  ;; 分割init.el
  (package-initialize)
  (custom-set-variables
   '(init-loader-show-log-after-init 'error-only))
  (init-loader-load)
  )
(when is_emacs25
  (add-to-load-path "site-lisp")
  ;; 分割init.el
  (package-initialize)
  (custom-set-variables
   '(init-loader-show-log-after-init 'error-only))
  (init-loader-load)
  )
(when is_emacs26
  (add-to-load-path "site-lisp")
  ;; 分割init.el
  (package-initialize)
  (custom-set-variables
   '(init-loader-show-log-after-init 'error-only))
  (init-loader-load)
  )

;; ============================
;; ウィンドウ設定
;; ============================
;; 別ウィンドウにだすバッファリスト
(setq special-display-buffer-names '("*Help*", "*compilation*", "*interpretation*", "*Occur*", "*undo-tree*", "*Buffer List*", "*GTAGS SELECT*"))

;; 起動時の画面フルサイズ
(set-frame-parameter nil 'fullscreen 'maximized)
;; (set-frame-parameter nil 'fullscreen 'fullboth)

;; 起動時に画面分割/ターミナル起動
;; (defun split-window-and-run-shell()
;; (setq w (selected-window))
;; (setq w2 (split-window w nil t))
;; (select-window w)
;; (when is_emacs24
;;   (enlarge-window 40 t) ;; 選択されているwindowを大きくする
;;   )
;; (when is_emacs25
;;   (enlarge-window 15 t) ;; 選択されているwindowを大きくする
;;   )

;; ;; (setq w3 (split-window w2 nil))
;; ;; (select-window w2)
;; ;; (enlarge-window 18)
;; ;; (select-window w3)
;; ;; (shell)
;; (select-window w))

;; (add-hook 'after-init-hook (lambda()(split-window-and-run-shell)))

;; ------------------------------
;; 一般設定
;; ------------------------------
(setq inhibit-startup-message t)  ;; スタートアップメッセージを非表示
(fset 'yes-or-no-p 'y-or-n-p)     ;; Emacsからの質問をy/nで回答する
(menu-bar-mode -1)                ;; メニューバー非表示
(tool-bar-mode -1)                ;; ツールバー非表示
(setq frame-title-format "%f")    ;; タイトルバーにファイルのフルパスを表示
(setq make-backup-files nil)      ;; バックアップファイルを作成させない
(setq delete-auto-save-files t)   ;; 終了時にオートセーブファイルを削除する
(setq auto-save-list-file-prefix nil) ;; auto-save-list を作成しない
(setq scroll-step 1)              ;; スクロールを1行にする
;;(set-scroll-bar-mode 'right)    ;; スクロールバーを右に表示
(set-scroll-bar-mode 'nil)        ;; スクロールバーを非表示
(fringe-mode (cons 0 0))          ;; 内枠の幅を0にする
(setq-default tab-width 2 indent-tabs-mode nil) ;; タブにスペースを使用する
(blink-cursor-mode t)             ;; カーソルの点滅をやめる
(show-paren-mode t)               ;; 対応する括弧を光らせる
(set-face-background 'region "#555")  ;; 選択領域の色
(delete-selection-mode t)         ;; リージョンを削除可能に設定
(cua-mode t)                      ;; 矩形選択可能にする
(setq cua-enable-cua-keys nil)    ;; 矩形選択の特殊なキーバインドを無効にする
(setq ring-bell-function 'ignore) ;; ビープ音 OFF
(global-auto-revert-mode 1)       ;; バッファが更新されればロード
;; ;; 行末の空白を強調表示
;; (setq-default show-trailing-whitespace t)
;; (set-face-background 'trailing-whitespace "#b14770")

;; C-x C-c で容易にEmacsを終了させないように質問する.
;; (setq confirm-kill-emacs 'y-or-n-p)

;; 改行コードを表示する
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; 行数を表示する
;;(require 'linum)
(global-linum-mode 0) ;; default 0 表示なし
(setq linum-format "%3d ")
(global-set-key (kbd "<f6>") 'linum-mode)

;; 折り返しトグル
;;リージョンに色をつける
(setq transient-mark-mode t)
;; 折り返し表示
(setq truncate-lines nil)
;; (setq truncate-partial-width-windows nil)
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;; ダイアログボックスの非表示化
(defalias 'message-box 'message)
(setq use-dialog-box nil)

;; =============================
;; 文字コードの指定
;; =============================
(set-default-coding-systems 'utf-8-unix) ; デフォルトの文字コードq
(setq default-file-name-coding-system 'utf-8) ;dired用 shift_jis


 ;; (when (equal (file-exists-p "/usr/share/emacs/site-lisp") t)
 ;;   (autoload 'toggle-input-method "mozc")
 ;;   (set-language-environment "japanese")
 ;;   (setq default-input-method "japanese-mozc")

 ;;   (global-set-key (kbd "C-SPC") 'toggle-input-method)
 ;;     )

;; (add-hook 'mozc-mode-hook
;;           (lambda()
;;             (define-key mozc-mode-map (kbd "C-SPC") 'toggle-input-method)))

;; =============================
;; フォント設定
;; =============================
(set-face-attribute 'default nil :height 120)                ;; デフォルトフォントサイズ

; 横幅1:2 ricty-12, ricty-13.5, ricty-15
(if (null (x-list-fonts "ricty-12"))
    (message "Fonts not found")
    (add-to-list 'default-frame-alist '(font . "ricty-12"))  ;; フォント読み込み
    )

;; default char encoding system as utf-8
(set-default-coding-systems 'utf-8)

;; =============================
;; デスクトップ
;; =============================
;; -----------------------------
;; C-x window間の移動
;; -----------------------------
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
;; (define-key global-map [C-right] 'windmove-right)
;; (define-key global-map [C-left] 'windmove-left)
;; (define-key global-map [C-up] 'windmove-up)
;; (define-key global-map [C-down] 'windmove-down)
(define-key global-map [M-right] 'windmove-right)
(define-key global-map [M-left] 'windmove-left)
(define-key global-map [M-up] 'windmove-up)
(define-key global-map [M-down] 'windmove-down)

;; フレーム間の移動
;; -----------------------------
(define-key global-map [M-prior] 'previous-multiframe-window) ; page up key
(define-key global-map [M-next] 'next-multiframe-window) ; page down key

;; -----------------------------------------------------------
;; C-c C-rでウィンドウリサイズ関数呼び出し (上W 下S 左A 右D)
;; -----------------------------------------------------------
(defun window-resizer ()
  "Control window size and position. (W/S/A/D)"
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?d)
               (enlarge-window-horizontally dx))
              ((= c ?a)
               (shrink-window-horizontally dx))
              ((= c ?s)
               (enlarge-window dy))
              ((= c ?w)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))
(global-set-key "\C-c\C-r" 'window-resizer)

;; Redo 設定
(use-package undo-tree
  :commands (undo-tree-mode)
  :bind (("C-S-z" . undo-tree-redo)
         ("C-z" . undo-tree-undo))
  :config
  ;; 設定
  (global-undo-tree-mode t)
  )

;; ミニバッファでコマンド実行
;;(setq enable-recursive-minibuffers t)

;; 印刷
(global-set-key (kbd "C-x P")(kbd "C-u M-x ps-print-buffer-with-faces"))  ;; psファイル作成
(global-set-key (kbd "C-x p")(kbd "C-u M-x ps-print-buffer"))              ;; グレースケール
;; psファイルをpdfにするコマンドは端末で $ ps2pdf hoge.ps

;; ===================================
;; バッファスワップ
;; ===================================
(defun swap-buffers-keep-focus ()
  (interactive)
  (swap-buffers t))
(global-set-key [f2] 'swap-buffers-keep-focus)
(global-set-key [S-f2] 'swap-buffers)

;; ===================================
;;  ローカル変数許可 (安全性低下に注意)
;; ===================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yatex yaml-mode undo-tree tabbar swap-buffers popwin perspective neotree init-loader google-translate flycheck ac-math)))
 '(safe-local-variable-values
   (quote
    ((mode . japanese-latex)
     (TeX-master . t)
     (TeX-master . main)))))

;; ===================================
;; タイムスタンプ
;; ===================================
;;; 最終更新日の自動挿入
;;; ファイルの先頭から 8 行以内に Time-stamp: <> または
;;; Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入されます
(require 'time-stamp)
(if (not (memq 'time-stamp write-file-functions))
(setq write-file-functions
(cons 'time-stamp write-file-functions)))

;;====================================
;; shell
;;====================================
;; e-shell 呼び出し
(global-set-key [f7] 'shell)

;;====================================
;; 行の複製
;;====================================
(defun copy-whole-line (&optional arg)
  "Copy current line."
  (interactive "p")
  (or arg (setq arg 1))
  (if (and (> arg 0) (eobp) (save-excursion (forward-visible-line 0) (eobp)))
      (signal 'end-of-buffer nil))
  (if (and (< arg 0) (bobp) (save-excursion (end-of-visible-line) (bobp)))
      (signal 'beginning-of-buffer nil))
  (unless (eq last-command 'copy-region-as-kill)
    (kill-new "")
    (setq last-command 'copy-region-as-kill))
  (cond ((zerop arg)
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))))
        ((< arg 0)
         (save-excursion
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line (1+ arg))
                                       (unless (bobp) (backward-char))
                                       (point)))))
        (t
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line arg) (point))))))
  (message (substring (car kill-ring-yank-pointer) 0 -1)))

(global-set-key (kbd "C-e") 'copy-whole-line)
(global-set-key (kbd "C-S-e") 'kill-whole-line)

;;====================================
;; 再帰の上限回数
;;====================================
;; (setq max-specpdl-size 10000) ;; デフォルト 1300
;; (setq max-lisp-eval-depth 10000) ;; デフォルト 600
 
;; ===================================
;; ディレクトリ以下を置換
;; ===================================
(global-set-key (kbd "C-%") 'find-name-dired)


(setq auto-mode-alist
      (append '(("\\.tex$" . tex-mode))
	      auto-mode-alist))


;; Other el
(load-file "~/.emacs.d/system/common/expansion.el")
(load-file "~/.emacs.d/system/common/development.el")
(load-file "~/.emacs.d/system/common/utility.el")
(load-file "~/.emacs.d/system/common/editor.el")
(load-file "~/.emacs.d/system/common/cache.el")

(load-file "~/.emacs.d/system/common/logging.el")
(load-file "~/.emacs.d/system/common/config.el")

(load-file "~/.emacs.d/system/frame/frame.el")
(load-file "~/.emacs.d/system/frame/modeline.el")
