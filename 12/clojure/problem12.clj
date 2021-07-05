(defn wheel-factor [n]
  (let [incrs [4 2 4 2 4 6 2 6]]
    (do
      (def test-ls (lazy-cat [2 3 5 7 11] (map + (drop 1 (cycle incrs)) (drop 4 test-ls))))
      (first (filter #(= 0 (rem n %)) test-ls))))
  )

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

(defn full-factor [algo n]
  (cond
    (or (is-prime? n) (= 1 n)) [n]
    :else 
      (let [fac (algo n)]
          (concat (full-factor algo fac) (full-factor algo (/ n fac))))
    ))

(defn run-length-encode [arr]
  (if (= 1 (count arr)) 
    [(list (first arr) 1)]
    (let [[x & xs] arr
          nxt      (run-length-encode xs)
          [nxt-x nxt-cnt] (first nxt)]
      (if (= x nxt-x)
        (concat [(list nxt-x (+ 1 nxt-cnt))] (rest nxt))
        (concat [(list x 1)] nxt))
      ))
  )

(defn count-factors [n]
  (let [factors (run-length-encode (full-factor wheel-factor n))]
    (reduce * (map #(+ 1 (second %)) factors)))
  )

(def triangular-nums (drop 1 (reductions + (range))))
  
(print (first (filter #(> (count-factors %) 500) triangular-nums)))
