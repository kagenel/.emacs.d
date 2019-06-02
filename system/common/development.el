;;
;; 開発支援系
;;

;; Git関連
(use-package magit
  :commands (magit-status)
  :bind (("M-g" . magit-status))
  :config
  ;; 設定
  (setq magit-auto-revert-mode t)
  )

;; gtags関連
(use-package gtags
  :commands (gtags-mode)
  :bind (("M-t" . gtags-find-tag)
         ("M-r" . gtags-find-rtag)
         ("M-s" . gtags-find-symbol)
         ("M-t" . gtags-pop-stack))
  :config
  ;; 設定
  (setq gtags-select-buffer-single t)
  )

;; インデントブロックの可視化
(use-package highlight-indentation
  :commands (highlight-indentation-mode)
  :init
  (add-hook 'yaml-mode-hook 'highlight-indentation-mode)
  (add-hook 'yaml-mode-hook '(lambda() (setq highlight-indentation-offset 2)))
  (add-hook 'python-mode-hook 'highlight-indentation-mode)
  (add-hook 'python-mode-hook '(lambda() (setq highlight-indentation-offset 4)))
  :config
  (setq highlight-indentation-offset 2)
  (set-face-background 'highlight-indentation-face "#383e4d")
  (set-face-background 'highlight-indentation-current-column-face "#4a5266")

  )

;; Markdown 設定
(use-package markdown-mode
  :commands (markdown-mode)
  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'"   . gfm-mode))
  :config
  ;; 設定
  )
