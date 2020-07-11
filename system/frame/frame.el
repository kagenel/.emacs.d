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

;; ファイル名/ディレクトリ名のみ表示
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(with-eval-after-load 'dired-x
  (bind-keys :map dired-mode-map
             ("<f8>" . dired-hide-details-mode)
             ("M-." . find-file-current-dir)))

;; -----------------------------
;; ディレクトリの移動キーを追加(wdired 中は無効)
;; -----------------------------
(define-key dired-mode-map (kbd "<backspace>") 'dired-up-directory)

;; サイズ表記変更
(setq dired-listing-switches "-alh")

;; -----------------------------
;; Editable Dired モード変更
;; -----------------------------
(define-key dired-mode-map (kbd "C-c C-e") (quote wdired-change-to-wdired-mode))

;; dired の sort を拡張する。
(defvar dired-sort-order '("" "t" "S" "X")
  "-t (時間) -X (拡張子) -S (サイズ) なし (アルファベット順) を切り替える。")
(defvar dired-sort-order-position 0)

(defun dired-rotate-sort ()
  "Rotate dired toggle sorting order by `dired-sort-order'"
  (interactive)
  (setq dired-sort-order-position
        (% (1+ dired-sort-order-position) (length dired-sort-order)))
  (setq dired-actual-switches
        (concat dired-listing-switches (elt dired-sort-order
                                          dired-sort-order-position)))
  (dired-sort-other dired-actual-switches))
(define-key dired-mode-map "s" 'dired-rotate-sort)

;; ===================================
;;  タブ
;; ===================================
(package-install 'tabbar-ruler) ;自動インストール
(require 'tabbar)
;;(require 'tabbar-ruler)
(tabbar-mode 1)

;; (setq tabbar-use-images nil)             ;; 画像を使わない(高速化)
(tabbar-mwheel-mode -1)                  ;; タブ上でマウスホイール操作無効
;; (setq tabbar-buffer-groups-function nil) ;; グループ化しない

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

(setq tabbar-separator '(1.5))          ;; タブの長さ

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 ;;:family "Comic Sans MS"
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

;; タブのグループ管理
;; すべてのタブを「emacs」と「user」の2つの可能なグループのいずれかに定義するタブグループ関数の例
(defun my-tabbar-buffer-groups () ;; customize to show all normal files in one group
      "Returns the name of the tab group names the current buffer belongs to.
    There are two groups: Emacs buffers (those whose name starts with '*', plus
    dired buffers), and the rest.  This works at least with Emacs v24.2 using
    tabbar.el v1.7."
      (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
                  ((eq major-mode 'dired-mode) "emacs")
                  (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

;; 最後に開いたタブを右端にセット
;; 元の関数をオーバーライド
(defun tabbar-add-tab (tabset object &optional append)
  "Override tabbar-add-tab, makes new tab open on the right of the current tab"
  (let ((tabs (tabbar-tabs tabset)))
    (if (tabbar-get-tab object tabset)
        tabs
      (let ((tab (tabbar-make-tab object tabset))
            (previous-tab (tabbar-selected-tab tabset))
            (other-tabs (list)))
        (tabbar-set-template tabset nil)
        (if append
            (progn
              (while (not (string= (format "%s" (car previous-tab)) (format "%s" (car (car tabs)))))
                (push (car tabs) other-tabs)
                (setq tabs (cdr tabs)))
              (push (car tabs) other-tabs)
              (setq tabs (cdr tabs))
              (push tab other-tabs)
              (setq other-tabs (reverse other-tabs))
              (set tabset (append other-tabs tabs)))
          (set tabset(cons tab tabs)))))))

;; スペースとアスタリスクの名前のバッファを非表示
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
(global-set-key (kbd "<M-s-down>") 'tabbar-forward-group)
(global-set-key (kbd "<M-s-up>") 'tabbar-backward-group)


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
