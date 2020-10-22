(defun range (end &key (start 0) (incr 1))
  (loop for n from start below end by incr
        collect n)
)

(defun isPrime (n)
  (cond
    ((<= n 1) nil)
    ((member n '(2 3 5)) T)
    (T (notany (lambda (x) (or (= 0 (mod n x)) (= 0 (mod n (+ 2 x))))) (append '(2 3) (range (+ 1 (isqrt n)) :start 5 :incr 6))))
  )
)

(defvar maxn 2000000)
(print (do ((n 0 (+ 1 n))
            (sum 0 (if (isPrime n) (+ n sum) sum))
           )

         ((< maxn n) sum)
       )
)
