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

;; ---------------------------------
;; シンタックス (重い?)
;; ---------------------------------
;; (add-hook 'after-init-hook #'global-flycheck-mode)
