;;
;; AUCTeX
;;
(with-eval-after-load 'tex-jp
  (dolist (command '("pTeX" "pLaTeX" "pBibTeX" "jTeX" "jLaTeX" "jBibTeX" "Mendex"))
    (delq (assoc command TeX-command-list) TeX-command-list)))
(setq japanese-TeX-engine-default 'uptex)
(setq japanese-LaTeX-default-style "bxjsarticle")
;(setq japanese-LaTeX-default-style "jlreq")
(setq TeX-engine 'uptex)
(setq TeX-PDF-from-DVI "Dvipdfmx")
(setq TeX-view-program-selection '((output-pdf "Evince")))
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-start-server t)
(setq TeX-source-correlate-mode t)
(add-hook 'LaTeX-mode-hook 'japanese-latex-mode)
(with-eval-after-load 'tex-jp
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode))
(add-hook 'LaTeX-mode-hook
          (function (lambda ()
                      (add-to-list 'TeX-command-list
                                   '("Latexmk"
                                     "latexmk %t"
                                     TeX-run-TeX nil (latex-mode) :help "Run Latexmk"))
                      (add-to-list 'TeX-command-list
                                   '("Latexmk-upLaTeX"
                                     "latexmk -e '$latex=q/uplatex %%O %(file-line-error) %(extraopts) %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -e '$dvipdf=q/dvipdfmx %%O -o %%D %%S/' -norc -gg -pdfdvi %t"
                                     TeX-run-TeX nil (latex-mode) :help "Run Latexmk-upLaTeX"))
                      (add-to-list 'TeX-command-list
                                   '("Latexmk-LuaLaTeX"
                                     "latexmk -e '$lualatex=q/lualatex %%O %(file-line-error) %(extraopts) %S %(mode) %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -norc -gg -pdflua %t"
                                     TeX-run-TeX nil (latex-mode) :help "Run Latexmk-LuaLaTeX"))
                      (add-to-list 'TeX-command-list
                                   '("Xdg-open"
                                     "xdg-open %s.pdf"
                                     TeX-run-discard-or-function t t :help "Run xdg-open"))
                      (add-to-list 'TeX-command-list
                                   '("Evince"
                                     ;"synctex view -i \"%n:0:%b\" -o %s.pdf -x \"evince -i %%{page+1} %%{output}\""
                                     "TeX-evince-sync-view"
                                     TeX-run-discard-or-function t t :help "Forward search with Evince"))
                      (add-to-list 'TeX-command-list
                                   '("Fwdevince"
                                     "fwdevince %s.pdf %n \"%b\""
                                     TeX-run-discard-or-function t t :help "Forward search with fwdevince"))
                      (add-to-list 'TeX-command-list
                                   '("Atril"
                                     ;"synctex view -i \"%n:0:%b\" -o %s.pdf -x \"atril -i %%{page+1} %%{output}\""
                                     "TeX-atril-sync-view"
                                     TeX-run-discard-or-function t t :help "Forward search with Atril"))
                      (add-to-list 'TeX-command-list
                                   '("Okular"
                                     "okular --unique \"file:\"%s.pdf\"#src:%n %a\""
                                     TeX-run-discard-or-function t t :help "Forward search with Okular"))
                      (add-to-list 'TeX-command-list
                                   '("Zathura"
                                     "zathura -x \"emacsclient --no-wait +%%{line} %%{input}\" --synctex-forward \"%n:0:%b\" %s.pdf"
                                     TeX-run-discard-or-function t t :help "Forward and inverse search with zathura"))
                      (add-to-list 'TeX-command-list
                                   '("Qpdfview"
                                     "qpdfview --unique \"\"%s.pdf\"#src:%b:%n:0\""
                                     TeX-run-discard-or-function t t :help "Forward search with qpdfview"))
                      (add-to-list 'TeX-command-list
                                   '("TeXworks"
                                     "synctex view -i \"%n:0:%b\" -o %s.pdf -x \"texworks --position=%%{page+1} %%{output}\""
                                     TeX-run-discard-or-function t t :help "Forward search with TeXworks"))
                      (add-to-list 'TeX-command-list
                                   '("TeXstudio"
                                     "synctex view -i \"%n:0:%b\" -o %s.pdf -x \"texstudio --pdf-viewer-only --page %%{page+1} %%{output}\""
                                     TeX-run-discard-or-function t t :help "Forward search with TeXstudio"))
                      (add-to-list 'TeX-command-list
                                   '("MuPDF"
                                     "mupdf %s.pdf"
                                     TeX-run-discard-or-function t t :help "Run MuPDF"))
                      (add-to-list 'TeX-command-list
                                   '("Firefox"
                                     "firefox -new-window %s.pdf"
                                     TeX-run-discard-or-function t t :help "Run Mozilla Firefox"))
                      (add-to-list 'TeX-command-list
                                   '("Chromium"
                                     "chromium --new-window %s.pdf"
                                     TeX-run-discard-or-function t t :help "Run Chromium"))
                      (add-to-list 'TeX-command-list
                                   '("AcroRead"
                                     "wine cmd /c start AcroRd32.exe %s.pdf"
                                     TeX-run-discard-or-function t t :help "Run Adobe Acrobat Reader DC")))))
