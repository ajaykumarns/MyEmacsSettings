(defvar dps-mode-hook nil)

(defvar dps-mode-map
  (let ((dps-mode-map (make-keymap)))
    (define-key dps-mode-map "\C-j" 'newline-and-indent)
    dps-mode-map)
  "Keymap for DPS major mode")

(add-to-list 'auto-mode-alist '("\\.dps\\'" . dps-mode))
(add-to-list 'auto-mode-alist '("\\.din\\'" . dps-mode))
(add-to-list 'auto-mode-alist '("\\.dmm\\'" . dps-mode))

(defvar dps-font-lock-comment-face 'dps-font-lock-comment-face
  "Face name to use for comments.")

(defvar dps-font-lock-preprocessor-face 'dps-font-lock-preprocessor-face
  "Face name to use for preprocessor directives.")

(defvar dps-font-lock-function-name-face 'dps-font-lock-function-name-face
  "Face name to use for function definitions.")

(defvar dps-font-lock-section-name-face 'dps-font-lock-section-name-face
  "Face name to use for section definitions.")

(defvar dps-font-lock-keyword-face 'dps-font-lock-keyword-face
  "Face name to use for DPS keywords.")

(defvar dps-font-lock-operator-name-face 'dps-font-lock-operator-name-face
  "Face name to use for DPS operators.")

(defvar dps-font-lock-stype-name-face 'dps-font-lock-stype-name-face
  "Face name to use for stream type definitions and declarations.")

(defvar dps-font-lock-literal-face 'dps-font-lock-literal-face
  "Face name to use for DPS literals.")

(defvar dps-font-lock-type-name-face 'dps-font-lock-type-name-face
  "Face name to use for type definitions and declarations.")

(defvar dps-font-lock-variable-name-face 'dps-font-lock-variable-name-face
  "Face name to use for type definitions and declarations.")

;; Custom faces to use for dps-font-lock.  Initialized from the standard
;; font lock faces
(defgroup dps-font-lock-faces nil
  "Faces used by the dps-font-lock package."
  :prefix "dps-font-lock"
  :group 'font-lock-faces)

(defface dps-font-lock-comment-face 
  '((((class color)(background light)) (:foreground "LavenderBlush4"))
    (((class color)) (:foreground "CadetBlue"))
    (t (:inverse-video t)))
  "Font Lock face used to highlight comments."
  :group 'dps-font-lock-faces)

(defface dps-font-lock-stype-name-face 
  '((((class color)(background light)) (:foreground "Goldenrod" :bold t))
    (((class color)) (:foreground "LightGoldenrod" :bold t))
    (t (:inverse-video t)))
  "Font Lock face used to highlight special types."
  :group 'dps-font-lock-faces)

(defface dps-font-lock-function-name-face 
  '((((class color)(background light)) (:foreground "NavajoWhite3"))
    (((class color)) (:foreground "NavajoWhite1"))
    (t (:inverse-video t)))
  "Font Lock face used to highlight function names."
  :group 'dps-font-lock-faces)

(defface dps-font-lock-keyword-face 
  '((((class color)(background light)) (:foreground "Blue" :bold t))
    (((class color)) (:foreground "SkyBlue" :bold t))
    (t (:inverse-video t)))
  "Font Lock face used to highlight keywords."
  :group 'dps-font-lock-faces)

(defface dps-font-lock-section-name-face 
  '((((class color)(background light)) (:foreground "DarkYellow" :bold t))
    (((class color)) (:foreground "Yellow" :bold t))
    (t (:inverse-video t)))
  "Font Lock face used to highlight sections."
  :group 'dps-font-lock-faces)

(defface dps-font-lock-preprocessor-face 
  '((((class color)(background light)) (:foreground "IndianRed"))
    (((class color)) (:foreground "NavajoWhite3"))
    (t (:inverse-video t)))
  "Font Lock face used to highlight preprocessor directives."
  :group 'dps-font-lock-faces)

(defface dps-font-lock-literal-face 
  '((((class color) (background light)) (:foreground "ForestGreen"))
    (((class color)) (:foreground "SpringGreen"))
    (t (:inverse-video t)))
  "Font Lock face used to highlight literals."
  :group 'dps-font-lock-faces)

(defface dps-font-lock-type-name-face 
  '((((class color)(background light)) (:foreground "DarkOliveGreen"))
    (((class color)) (:foreground "DarkSeaGreen1"))
    (t (:inverse-video t)))
  "Font Lock face used to highlight type names."
  :group 'dps-font-lock-faces)

(defface dps-font-lock-operator-name-face 
  '((((class color)(background light)) (:foreground "SlateBlue"))
    (((class color)) (:foreground "MediumSlateBlue"))
    (t (:inverse-video t)))
  "Font Lock face used to highlight operators."
  :group 'dps-font-lock-faces)

(defface dps-font-lock-variable-name-face 
  '((((class color)(background light)) (:foreground "DarkRed"))
    (((class color)) (:foreground "Red"))
    (t (:inverse-video t)))
  "Font Lock face used to highlight variable names."
  :group 'dps-font-lock-faces)

(defun set-my-colors ()  
  (progn (setq font-lock-string-face dps-font-lock-literal-face))
  (progn (setq font-lock-comment-face dps-font-lock-comment-face))
)

(defconst dps-font-lock-keywords-1
  (list '("\\<\\(Program\\|FunctionDebug\\|Application\\|Nodepools\\|Libdefs\\|Typedefs\\)\\>" . dps-font-lock-section-name-face)
        '("\\<\\(asc\\|desc\\|\\(for\\|ha\\)_begin\\|\\(for\\|ha\\)_end\\|compressed\\|blocksize\\|blockSize\\|resetValues\\|resetValues\\|eolMarker\\|eolmarker\\|\\(csv\\|bin\\|xml\\|udfbin\\|udftxt\\)\\(format\\|Format\\)\\|workloadSize\\|interArrivalTime\\|drop\\(punct\\|Punct\\)\\|drop\\(payload\\|Payload\\)\\|\\(inc\\|lib\\)\\(path\\|Path\\)\\|libs\\|package\\|size\\(of\\|Of\\)\\|nod\\(e\\|eFor\\|efor\\)\\|no\\(Delays\\|delays\\)\\|Null\\|Nil\\|per\\(group\\|Group\\)\\|schema\\(for\\|For\\)\\|payload\\|partitio\\(n\\|nfor\\|nFor\\)\\|typedef\\|nodepool\\|defaultpool\\|trace\\|debug\\|info\\|warn\\|error\\|fatal\\|before\\|after\\|punctless\\|import\\|export\\|properties\\|tapping\\|monitor\\|init\\(delay\\|Delay\\)\\|throttled\\(Rate\\|rate\\)\\|\\(in\\|out\\)putTransport\\|wrapper\\|restartable\\|mobile\\|checkpoint\\|profile\\)\\>" . dps-font-lock-keyword-face)
        '("\\<\\(Functor\\|Punctor\\|Aggregate\\|Barrier\\|Sort\\|Split\\|Delay\\|Join\\|Udop\\|MTUdop\\|Source\\|Sink\\)\\>" . dps-font-lock-operator-name-face)
        '("\\<\\(stream\\|vstream\\|bundle\\|use\\|print\\)\\>" . dps-font-lock-stype-name-face))
  "Minimal highlighting expressions for DPS mode")

(defconst dps-font-lock-keywords-2
  (append dps-font-lock-keywords-1
    (list '("#include\\|#define\\|%%\\|%[0-9]+\\|@[a-zA-Z0-9_]+" . dps-font-lock-preprocessor-face)
          '("\\<\\(Any\\|Avg\\|Sum\\|Cnt\\|DCnt\\|VCnt\\|MCnt\\|GCnt\\|BCnt\\|Col\\|DCol\\|Last\\|First\\|Min\\|Max\\|time\\|attrb\\|count\\|punct\\)\\>" . font-lock-function-name-face)))
  "Additional Keywords to highlight in DPS mode")

(defconst dps-font-lock-keywords-3
  (append dps-font-lock-keywords-2
    (list '("\\<\\(Boolean\\(List\\)?\\|Short\\(List\\)?\\|Byte\\(List\\)?\\|Double\\(List\\)?\\|Float\\(List\\)?\\|Integer\\(List\\)?\\|Long\\(List\\)?\\|String\\(List\\)?\\)\\>" . dps-font-lock-type-name-face)
          '("\\(vstream\\|stream\\|bundle\\)[ \t]+\\([a-zA-Z][a-zA-Z0-9_]*\\)" 2 dps-font-lock-variable-name-face)
          '("\\<\\(true\\|false\\)\\>\\|\\($\\|\\^\\)[0-9]+\\|\\(\\([0-9]+\\(l\\|s\\|b\\)?\\|\\([0-9]*\\.[0-9]+\\([+-]e[0-9]+\\)?\\)\\)d?\\)" . dps-font-lock-literal-face)))
   "Balls-out highlighting in DPS mode")

(defvar dps-font-lock-keywords dps-font-lock-keywords-3
  "Default highlighting expressions for DPS mode")

(defun dps-indent-line ()
  "Indent current line as DPS code"
  (interactive)
  (beginning-of-line)
  (if (bobp)  ; at the beginning of the buffer, indent to column 0
      (indent-line-to 0)
      (let ((not-indented t) cur-indent)
          (if (looking-at "^[ \t]*\w+_end") ; if a loop end
              (progn
                  (save-excursion
                      (forward-line -1)
                      (setq cur-indent (- (current-indentation) default-tab-width)))
                  (if (< cur-indent 0) ; do not go beyond left margin
                      (setq cur-indent 0)))
              (save-excursion 
                  (while not-indented
                      (forward-line -1)
                      ; if found an end first
                      (if (looking-at "^[ \t]*\w+_end") 
                          (progn
                              (setq cur-indent (current-indentation))
                              (setq not-indented nil))
                      ; if found a begin first
                      (if (looking-at "^[ \t]*\w+_begin")
                          (progn
                              (setq cur-indent (+ (current-indentation) default-tab-width))
                              (setq not-indented nil))
                      (if (bobp) ; If none, do not indent
                          (setq not-indented nil)))))))
          (if cur-indent
               (indent-line-to cur-indent)
               (indent-line-to 0))))) ; If no indentation hint, then no indentation

(defvar dps-mode-syntax-table
  (let ((dps-mode-syntax-table (make-syntax-table)))
       (modify-syntax-entry ?_ "w" dps-mode-syntax-table)
       (modify-syntax-entry ?# ". 14" dps-mode-syntax-table)
       (modify-syntax-entry ?\ ". 2b" dps-mode-syntax-table)
       (modify-syntax-entry ?* ". 23" dps-mode-syntax-table)
       (modify-syntax-entry ?\n "> b" dps-mode-syntax-table)
       dps-mode-syntax-table)
  "Syntax table for dps-mode")

(defun dps-mode ()
  "Major mode for editing SPADE (DPS) Language files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table dps-mode-syntax-table)
  (use-local-map dps-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(dps-font-lock-keywords))
  (set (make-local-variable 'indent-line-function) 'dps-indent-line)  
  (setq major-mode 'dpw-mode)
  (setq mode-name "DPS")
  (set-my-colors)
  (run-hooks 'dps-mode-hook))

(provide 'dps-mode)







