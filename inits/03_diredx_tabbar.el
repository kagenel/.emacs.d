;; dired-x(ファイラー)
(require 'dired-x)

;; ===================================
;;  ディレクトリツリー
;; ===================================
(autoload 'neotree "neotree")
;(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; ===================================
;;  dired-x(ファイラー)
;; ===================================
;;(require 'dired-x)

;; dired-find-alternate-file の有効化
(put 'dired-find-alternate-file 'disabled nil)
;; RET 標準の dired-find-file では dired バッファが複数作られるので
;; dired-find-alternate-file を代わりに使う
(define-key dired-mode-map (kbd "RET") 'dired-open-in-accordance-with-situation)
(define-key dired-mode-map (kbd "a") 'dired-find-file)

;; ファイルなら別バッファで、ディレクトリなら同じバッファで開く
;; (defun dired-open-in-accordance-with-situation ()
;;   (interactive)
;;   (let ((file (dired-get-filename)))
;;     (if (file-directory-p file)
;;         (dired-find-alternate-file)
;;       (dired-find-file))))
;; 改良版(./ ../ の修正)
(defun dired-open-in-accordance-with-situation ()
    (interactive)
    (cond ((string-match "\\(?:\\.\\.?\\)"
                         (format "%s" (thing-at-point 'filename)))
           (dired-find-alternate-file))
          ((file-directory-p (dired-get-filename))
           (dired-find-alternate-file))
          (t
           (dired-find-file))))

;; -----------------------------
;; ディレクトリの移動キーを追加(wdired 中は無効)
;; -----------------------------
;; (define-key dired-mode-map (kbd "<left>") 'dired-up-directory)
;; (define-key dired-mode-map (kbd "<right>") 'dired-open-in-accordance-with-situation)
(define-key dired-mode-map (kbd "<backspace>") 'dired-up-directory)

;; サイズ表記変更
(setq dired-listing-switches "-alh")

;; -----------------------------
;; Editable Dired モード変更
;; -----------------------------
(define-key dired-mode-map (kbd "C-c C-e") (quote wdired-change-to-wdired-mode))


;; ===================================
;;  タブ
;; ===================================
(package-install 'tabbar-ruler) ;自動インストール
;; tabbar/ruler
(require 'tabbar)
;;(require 'tabbar-ruler)
(tabbar-mode 1)

;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブの長さ
(setq tabbar-separator '(1.5))

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :family "Comic Sans MS"
 :background "#5f9ea0"
 :foreground "gray72"
 :height 0.7)
(set-face-attribute
 'tabbar-unselected nil
 :background "#5f9ea0"
 :foreground "grey72"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "#5f9ea0"
 :foreground "yellow"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 0.5)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
  '(;"*scratch*" 
    ;"*Messages*" 
    "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
    "*Regexps matches buffer names always included tabs.")

(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; Chrome ライクなタブ切り替えのキーバインド
(global-set-key (kbd "<M-s-right>") 'tabbar-forward-tab)
(global-set-key (kbd "<M-s-left>") 'tabbar-backward-tab)

;; タブ上をマウス中クリックで kill-buffer
(defun my-tabbar-buffer-help-on-tab (tab)
  "Return the help string shown when mouse is onto TAB."
  (if tabbar--buffer-show-groups
      (let* ((tabset (tabbar-tab-tabset tab))
             (tab (tabbar-selected-tab tabset)))
        (format "mouse-1: switch to buffer %S in group [%s]"
                (buffer-name (tabbar-tab-value tab)) tabset))
    (format "\
mouse-1: switch to buffer %S\n\
mouse-2: kill this buffer\n\
mouse-3: delete other windows"
            (buffer-name (tabbar-tab-value tab)))))

(defun my-tabbar-buffer-select-tab (event tab)
  "On mouse EVENT, select TAB."
  (let ((mouse-button (event-basic-type event))
        (buffer (tabbar-tab-value tab)))
    (cond
     ((eq mouse-button 'mouse-2)
      (with-current-buffer buffer
        (kill-buffer)))
     ((eq mouse-button 'mouse-3)
      (delete-other-windows))
     (t
      (switch-to-buffer buffer)))
    ;; Don't show groups.
    (tabbar-buffer-show-groups nil)))

(setq tabbar-help-on-tab-function 'my-tabbar-buffer-help-on-tab)
(setq tabbar-select-tab-function 'my-tabbar-buffer-select-tab)

