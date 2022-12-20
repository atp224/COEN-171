(define (insert tree node)
    (cond
        ((null? tree) (list node '() '()))

        ((> (car tree) node) (list(car tree) (insert (cadr tree) node)(caddr tree)))

        ((< (car tree) node) (list(car tree) (cadr tree)(insert (caddr tree) node)))

        (else tree)
    )
) 

(define (member? tree node)
    (cond 
        ((null? tree)#f)
    
        ((< node (car tree))(member? (cadr tree) node))

        ((> node (car tree))(member? (caddr tree) node))

        (else #t)
    )
)
