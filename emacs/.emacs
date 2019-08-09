;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; add additional packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(default-input-method "eim-wb")
 '(dired-dwim-target t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (imenu-anywhere imenus popup-imenu imenu-list company-shell company)))
 '(show-paren-mode t)
 '(tooltip-mode nil)
 '(tramp-copy-size-limit nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'linum)
(setq linum-format
      (lambda (line)
        (propertize (number-to-string (1- line)) 'face 'linum)))

;;show line number left
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; config eim
(add-to-list 'load-path (expand-file-name "site-lisp/eim" user-emacs-directory))
(autoload 'eim-use-package "eim" "Another emacs input method")
(setq eim-use-tooltip nil) ;; Tooltip 暂时还不好用
(register-input-method
 "eim-wb" "euc-cn" 'eim-use-package
 "五笔" "汉字五笔输入法" "wb.txt")
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "汉字拼音输入法" "py.txt")
(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii) ;; 用 ; 暂时输入英文

;;enable bash-completion
(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
	  'bash-completion-dynamic-complete)

;; set tramp config
(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

;; company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-show-numbers t)
(setq company-idle-delay 0)
(add-hook 'sh-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends)
		  '(company-capf company-shell-env company-dabbrev company-files))))
(setq company-dabbrev-downcase nil)					  

;; config emacs-htmlize
(add-to-list 'load-path (expand-file-name "site-lisp/emacs-htmlize" user-emacs-directory))
(put 'upcase-region 'disabled nil)
