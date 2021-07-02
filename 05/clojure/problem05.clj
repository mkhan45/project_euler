(defn gcd [a b]
  (if (= 0 b)
    a
    (gcd b (rem a b))))

(defn lcm [a b]
  (/ (* a b) (gcd a b)))

(println (reduce lcm (drop 1 (range 20))))
