;;; jdee, for java

;; for jdee 2.4.0.1, in case `jde-get-jdk-dir' throws an error, the
;; environment variable may be required, e.g., put the following in
;; ~/.bashrc
;; export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-i386/

(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/jdee/lisp"))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/cogre"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/common"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/contrib"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/ede"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/eieio"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/semantic"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/speedbar"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/cedet/srecode"))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/elib"))

(require 'cedet)
(require 'jde)

(setq semantic-load-turn-useful-things-on t)

;; Disable version check. Current version of jdee supports only lower
;; version of cedet
(setq jde-check-version-flag nil)

;; for obsolete functions in emacs 24
(defun screen-width nil -1)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

;; c style 
;(setq c-default-style '((java-mode . "linux")))
(add-hook 'jde-mode-hook (lambda ()
  (smart-operator-mode)
  (c-set-style "linux")
  (setq indent-tabs-mode nil            ; disable tabs
        c-basic-offset 4)               ; 4 spaces of basic offset
  (c-set-offset 'case-label '+)))       ; switch-case indentation style
                          
;; example of prj.el, which should be put in the root directory of the project
(when nil
;; START OF prj.el
(jde-project-file-version "1.0")

(jde-set-variables
 '(jde-global-classpath
   (quote
    ("bin/classes"
     "~/android-sdk/platforms/android-19/android.jar")))

 '(jde-sourcepath
   (quote
    ("src/com/jws/aua"
     "test/src/com/jws/aua")))

 ;; what should be put as java file header
 '(jde-gen-buffer-boilerplate
   (quote
    ("/*******************************************************************************"
     " * Copyright (c) 2012-2020 JWS"
     " *"
     " * All rights reserved."
     " *******************************************************************************/")))
 ;; sorting imports
 '(jde-import-auto-sort t)

 ;; Defines bracket placement style - now it is set according to SUN standards
 '(jde-gen-k&r t)

 '(user-full-name "enroute")
 '(user-mail-address "enroute.smth@gmail.com")
 )
;; END OF prj.el
)