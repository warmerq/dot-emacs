;;; package --- my init entry file
;;; Commentary: start from here


(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; ensure package installation
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; mannually installed package would be in ./lisp
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(use-package f)
(require 'f)

(defun add-tangle-headers ()
  (message "running in %s" (buffer-file-name))
  (cond
   ((f-ext? (buffer-file-name) "el")
    (goto-char (point-min))
    (insert ";;; -*- lexical-binding: t -*-\n"))
   (t
    nil))
  (save-buffer))

(add-hook 'org-babel-post-tangle-hook 'add-tangle-headers)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
