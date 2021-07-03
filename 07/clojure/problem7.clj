(defn is-prime? [n]
  (cond
    (= n 1)                 false
    (some #(= n %) [2 3 5]) true
    :else                  
      (let [pred-1 #(= 0 (rem n %))
            pred-2 #(= 0 (rem n (+ 2 %)))
            isqrt  (Math/ceil (Math/sqrt n))
            test-ls (concat [2 3] (range 5 isqrt 6))]
        (not (some #(or (pred-1 %) (pred-2 %)) test-ls))
      )
  )
)

(print (nth (filter is-prime? (range)) 10001))
