(defun range (end &key (start 0) (incr 1))
  (loop for n from start below end by incr
        collect n)
)

(defun isPrime (n)
  (if (= 1 n) (return-from isPrime nil))
  (if (member n '(2 3 5)) (return-from isPrime T))
  (notany (lambda (x) (or (= 0 (mod n x)) (= 0 (mod n (+ 2 x))))) (append (range (isqrt n) :start 5 :incr 6) '(2 3)))
)

(print (do ((x 0 (+ 1 x))
            (cnt 0 (if (isPrime x) (+ 1 cnt) 
                                    cnt))
           )
           
           ((= 10001 cnt) x)
       )
)
