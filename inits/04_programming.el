;; ===================================
;; プログラミング関連
;; ===================================

;; ===================================
;; 自動補完設定
;; ===================================
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;; auto-completeの色変更
(set-face-background 'ac-completion-face "#333333")               
(set-face-foreground 'ac-candidate-face "#666666")
(set-face-background 'ac-selection-face "#666666")  
(set-face-foreground 'popup-summary-face "white")  ;; 候補のサマリー部分
(set-face-background 'popup-tip-face "cyan")       ;; ドキュメント部分
(set-face-foreground 'popup-tip-face "white")

(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)          ;; 曖昧マッチ

;; ---------------------------------
;; コード折り返し機能
;; ---------------------------------
(add-hook 'c++-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'c-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'scheme-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'lisp-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'python-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(add-hook 'xml-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
(define-key global-map (kbd "C-c /") 'hs-toggle-hiding)


;; gtags
(autoload 'gtags "gtags")
;(require 'gtags)
;; gtags-find-tag で検索時に以前のバッファが残らないようにクリアする
(setq gtags-select-buffer-single t)
(global-set-key "\M-t" 'gtags-find-tag)
(global-set-key "\M-r" 'gtags-find-rtag)
(global-set-key "\M-s" 'gtags-find-symbol)
(global-set-key "\C-t" 'gtags-pop-stack)

;; ---------------------------------
;; シンタックス (重い?)
;; ---------------------------------
(add-hook 'after-init-hook #'global-flycheck-mode)

;; ---------------------------------
;;  yaml
;; ---------------------------------
;; (package-install 'yaml-mode) ;自動インストール
(require 'yaml-mode) ;; 23
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.work\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.conf\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.model\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.cnoid\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.wrl\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.body\\'" . yaml-mode))

;; ---------------------------------
;;  python
;; ---------------------------------
(add-hook 'python-mode-hook
                   '(lambda ()
                        (setq indent-tabs-mode nil)
                        (setq indent-level 4)
                        (setq python-indent 4)
                        (setq tab-width 4)))

(add-hook 'python-mode-hook
          '(lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

(add-hook 'python-mode-hook
          '(lambda()
               (setq electric-pair-mode t)
               ))
;; ===================================
;; インデントブロックの可視化
;; ===================================
(when is_emacs24
  (package-install 'highlight-indentation) ;自動インストール

  (require 'highlight-indentation)
  (setq highlight-indentation-mode)
  (setq highlight-indentation-offset 2)
  (set-face-background 'highlight-indentation-face "#383e4d")
  (set-face-background 'highlight-indentation-current-column-face "#4a5266")

  ;; yaml hook
  (add-hook 'yaml-mode-hook 'highlight-indentation-mode)
  (add-hook 'yaml-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'yaml-mode-hook '(lambda() (setq highlight-indentation-offset 2)))

  ;; python hook
  (add-hook 'python-mode-hook 'highlight-indentation-mode)
  (add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'python-mode-hook '(lambda() (setq highlight-indentation-offset 4)))
)
