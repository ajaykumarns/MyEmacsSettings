(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fringe-mode 0 nil (fringe))
 '(inhibit-startup-screen t)
 '(menu-bar-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(setq scroll-step 1)
(line-number-mode 1)
(column-number-mode 1)
(setq auto-fill-mode 1)
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(defun quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
	(end (line-beginning-position 2)))
    (if (eq last-command 'quick-copy-line)
	(kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end))))
  (beginning-of-line 2))
(defun nuke-line()
  "Kill an entire line, including the trailing newline character"
  (interactive)
  (setq previous-column (current-column))
  (end-of-line)
  (if (= (current-column) 0)
      (delete-char 1)
    (progn
      (beginning-of-line)
      (kill-line)
      (delete-char 1)
      (move-to-column previous-column))))

(global-set-key (kbd "C-.") 'nuke-line)
(global-set-key (kbd "C-,") 'quick-copy-line)
(global-set-key (kbd "C-\\") 'dabbrev-expand)
(global-set-key "\C-c\C-k"   'kill-this-buffer)
(global-set-key (kbd "C-<tab>") 'next-buffer)
(global-set-key (kbd "<C-S-iso-lefttab>") 'previous-buffer)
(global-unset-key "\C-x o") ;unbind this key for next-window
(global-unset-key "\C-c\C-d") ;unbind this key
(global-unset-key "\M-g g") ;unbind goto-line key
(global-set-key "\C-x\C-g" 'goto-line)
(global-set-key "\C-c\C-d" 'duplicate-line)
(global-set-key (kbd "<C-M-next>") 'next-multiframe-window)

(tool-bar-mode -1)
(menu-bar-mode 0)
;(desktop-load-default)
;(desktop-read)
;(desktop-save-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.6.1c")
(add-to-list 'load-path "~/.emacs.d/autocomplete")
(add-to-list 'load-path "~/.emacs.d/scala-mode")
(require 'linum)
(global-linum-mode 1)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 96 :Width normal :foundry "microsoft" :family "Consolas"))))
 '(linum ((t (:inherit (shadow default) :inverse-video t)))))
(require 'popup)
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'yasnippet)
(require 'scala-mode-auto)
(setq yas/trigger-key "\C-x\C-k")
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")
(setq yas/my-directory "~/.emacs.d/scala-mode/contrib/yasnippet/snippets")
(yas/load-directory yas/my-directory)
(add-hook 'scala-mode-hook
	  '(lambda()
	     (yas/minor-mode-on)
	     ))

(global-auto-complete-mode t) 
(setq ac-auto-start 5)
(setq ac-dwim t)
;(set-default 'ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir ac-source-symbols))
