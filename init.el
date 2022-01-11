(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives
;;       '("melpa3" . "http://www.mirrorservice.org/sites/stable.melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; mannually installed package would be in ./lisp
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(defun add-tangle-headers ()
  (message "running in %s" (buffer-file-name))
  (cond
   ;; ((f-ext? (buffer-file-name) "py")
   ;;  (goto-char (point-min))
   ;;  (insert "# This is a generated file do not edit\n"))
   ((f-ext? (buffer-file-name) "el")
    (goto-char (point-min))
    (insert ";;; -*- lexical-binding: t -*-\n"))
   (t
    nil))
  (save-buffer))

(add-hook 'org-babel-post-tangle-hook 'add-tangle-headers)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
