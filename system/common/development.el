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

;; yaml 設定
(use-package yaml-mode
  :commands (yaml-mode)
  :mode (("\\.yml\\'" . yaml-mode)
         ("\\.yaml\\'" . yaml-mode)
         ("\\.work\\'" . yaml-mode)
         ("\\.conf\\'" . yaml-mode)
         ("\\.model\\'" . yaml-mode)
         ("\\.cnoid\\'" . yaml-mode)
         ("\\.wrl\\'" . yaml-mode)
         ("\\.body\\'" . yaml-mode)
         ("\\.controller\\'" . yaml-mode))
  :config
  ;; 設定
  )

;;  python 設定
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
               ;;(setq electric-pair-mode t)
               ))

;; flycheck - error check
(defun my/turn-on-flycheck-mode ()
  (flycheck-mode 1))
(add-hook 'python-mode-hook 'my/turn-on-flycheck-mode)

;; jedi - completion for python
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; auto complete
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; py-yapf - auto format
(require 'py-yapf)
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
