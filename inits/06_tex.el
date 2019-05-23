
(add-to-list 'auto-mode-alist '("\\.tex\\'" . flyspell-mode))


;; org-mode setting
(require 'ox-latex)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))



;; (setq org-support-shift-select nil)

; ファイルの場所
(setq org-directory "~/ownCloud/Org")
;(setq org-directory "~/Dropbox/Org")
(setq org-default-notes-file "notes.org")

(setq org-latex-default-class "jsarticle")

;;; LaTeX 形式のファイル PDF に変換するためのコマンド
(setq org-latex-pdf-process
      '("platex %f"
        "platex %f"
        "platex %f"
        "platex %f"
        "dvipdfmx %b.dvi"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ドキュメントクラスの追加

;; org-latex-classes
(add-to-list 'org-latex-classes
             '("jsarticle"
               "\\documentclass[twocolumn,platex]{jsarticle}
                [NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
               ))
