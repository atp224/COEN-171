(define (inorder t)
    if (null? t) 
        (append (inorder (cadr t)) (cons (car t) (inorder (caddr t)))))