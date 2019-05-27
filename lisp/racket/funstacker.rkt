          ; Number String Image -> Image
          ; adds s to img, y pixels from top
(define (add-image y s img)
  (place-image (text s 10 "red") 10 y img))

(define stack empty)


(define (pop-stack!)
  (define arg (first stack))
  (set! stack (rest stack))
  arg)

(define (push-stack! arg)
  (set! stack (cons arg stack)))

(define (handle [arg #f])
  (cond
   [(number? arg) (push-stack! arg)]
   [(or (equal?  * arg) (equal? + arg))
    (define op-result (arg  (pop-stack!) (pop-stack!)))
    (push-stack! op-result)]))

(provide handle)
   
(check-ex)