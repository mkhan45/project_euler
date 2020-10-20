(setq ans (do ((a 0 b)
               (b 2 (+ a (* 4 b)))
               (sum 0 (+ b sum)))

              ((< 40000000 b) sum)
          )
)

(format t "~d~%" ans)
