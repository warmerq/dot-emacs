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

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
