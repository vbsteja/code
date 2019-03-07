
(defn hypot[x,y]
  (let [x2 (* x x)
        y2 (* y y)]
   (println "the square roots of the given values %s and %s are")
   (Math/sqrt ( + x2 y2))))

(defn -main[]
  (hypot  3 4))
(println(-main))
(println (reduce (fn [new-map [key val]]
                   (assoc new-map key (inc val)))
                 {}
                 {:max 30 :min 10}))
(defn gues-game
  []
  (loop [name (read-line "enter your name") age 0]
    (while (>= 18 (read-line "enter your age"))
      (println "sure you want to play this dirty guessing game? yes/no")
      (if (== "yes" read-line)))))
