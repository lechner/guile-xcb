 ;; This file is part of Guile XCB.

 ;;    Guile XCB is free software: you can redistribute it and/or modify
 ;;    it under the terms of the GNU General Public License as published by
 ;;    the Free Software Foundation, either version 3 of the License, or
 ;;    (at your option) any later version.

 ;;    Guile XCB is distributed in the hope that it will be useful,
 ;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
 ;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ;;    GNU General Public License for more details.

 ;;    You should have received a copy of the GNU General Public License
 ;;    along with Guile XCB.  If not, see <http://www.gnu.org/licenses/>.

(define-module (language xml-xcb spec)
  #:use-module (ice-9 curried-definitions)
  #:use-module (sxml simple)
  #:use-module (ice-9 control)
  #:use-module (language xml-xcb compile-scheme)
  #:use-module (system base language)
  #:export (xml-xcb xcb-begin))

(define (make-default-environment)
  (let ((m (make-fresh-user-module)))
    (module-use! m (resolve-interface '(xcb struct)))
    (module-use! m (resolve-interface '(xcb union)))
    m))

(define element-precedence
  '(import typedef xidtype xidunion enum struct union error event errorcopy    
           eventcopy request))

(define (index-of el l)
  (let inner ((el el) (l l) (i 0))
    (cond
     ((null? l) (error "xml-xcb: uknown xcb macro: " el))
     ((eq? (car l) el) i)
     (else (inner el (cdr l) (1+ i))))))

(define (element-compare el1 el2)
  (<
   (index-of (car el1) element-precedence)
   (index-of (car el2) element-precedence)))

;; The reader is a bit odd because trying to compile an entire xml-xcb
;; file in one pass can cause a stack overflow. So the reader actually
;; reads the whole file with xml->sxml on the first call and returns
;; only the parent tag with its children stripped out. It then sorts
;; the children so that they are evaluated in the right order (imports
;; and typedefs first, structs, then requests, etc.) and returns them
;; one at a time on subsequent calls until they run out, at which
;; point it finally returns #<eof>.
(define custom-read
  (let ((xml #f))
    (lambda (port env) 
      ;; Remove leading whitespace
      (while (and (not (eof-object? (peek-char port)))
                  (char-whitespace? (peek-char port))) 
        (read-char port))
      (if (eof-object? (peek-char port))
          (if (null? xml)
              (peek-char port)
              (let ((next-xml (car xml)))
                (set! xml (cdr xml))
                next-xml))
          (begin
            (let* ((the-whole-thing (xml->sxml port #:trim-whitespace? #t))
                   (the-important-part  ;; minus *TOP* and *PI*
                    (if (eq? (caadr the-whole-thing) '*PI*)
                        (caddr the-whole-thing)
                        (cadr the-whole-thing))))
              (set! xml (cons (list 'xcb-2 (cadr the-important-part))
                              (sort (cddr the-important-part) element-compare)))
              (list (car the-important-part) (cadr the-important-part))))))))

(define-language xml-xcb
  #:title "xml-xcb"
  #:reader custom-read
  #:compilers `((scheme . ,compile-scheme))
  #:make-default-environment make-default-environment
  #:printer write)
