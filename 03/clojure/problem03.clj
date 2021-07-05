(defn wheel-factor [n]
  (let [incrs [4 2 4 2 4 6 2 6]]
    (do
      (def test-ls (lazy-cat [2 3 5 7 11] (map + (cycle incrs) (drop 4 test-ls))))
      (first (filter #(= 0 (rem n %)) test-ls)))))

(def n 13195)
(defn largest-factor [n]
  (do
    (println n)
    (let [smallest-factor (wheel-factor n)
          new-factor      (largest-factor (/ n smallest-factor))]
      (if (or (= n smallest-factor) (> smallest-factor new-factor)) 
        smallest-factor 
        new-factor))))
