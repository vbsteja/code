(ns practice.core
  (:gen-class))


(defn cond-check "this is a fucntion to check conditions"
  [x y]
  (if (> x y) (print x "is greater") (print y "is greater")))

 (defn odd-even[n] (if (odd? n)
                  (format "%s is odd" n)
                  (format "%s is even" n)))
 (defn facto [n]
   (loop [cnt n fact 1]
     (if (zero? cnt)
       fact
       (recur (dec cnt) (* fact cnt)))))
 
 (defn negate-str
   [& numbers]
   (str( - (apply + numbers))))
 
 (def negate-str1(comp str - +))
 
 (defn thread-ex
   [ms]
   (println "entered thread-ex")
   (Thread/sleep ms)
   (println "Leaving my thread"))
 
 (defn my-fn []
     (let [thread (Thread. #(thread-ex 100))]
    (.start thread)
    (println "thread started ")
    (while (.isAlive thread)
      (print ".")
      (flush))
    (println "Thread Stopped")))
 
 
 (defn swap-pair
   [seqs]
   (into (empty seqs)
         (interleave
           (take-nth 2 (drop 1 seqs))
           (take-nth 2 seqs))))
 
 (defn random-ints
   "a function implementing the lazy-seq for geenrating random integers"
   [limit]
   (lazy-seq
     (cons (rand-int limit)
           (random-ints limit))))
 (defn -main
  []
  ( map odd-even [-6,0,1,2,3,4,5,6])
  (facto 5)
  (print (negate-str 10 20 30 40))
  )
 
;a function to find the sum of the natural numbers who are multiples of 3,5
 (apply + (filter #(zero? (min (mod % 3) (mod % 5))) (range 1000)))

;project euler Problem;
(def fibo (lazy-cat [0 1] 
                    (map + fibo (rest fibo))))

;project euler problem
(defn get-largest-prime-factor [num]
  (let [q (long (Math/sqrt num))                ; we don't need to check further than this
        factor? (fn [a b] (zero? (rem a b)))]   ; utility helper fn
    (loop [n num d 2]                           ; starting iteration: n := num d := 2
      (cond
       (> d q) n                                ; we're done if we've reached the limit (sqrt(num))
       (= d n) n                                ; or the two tested numbers are equal (for the inner iteration)
       (factor? n d) (recur (/ n d) d)          ; if n is divisible by d, let's divide it and iterate
       true          (recur n (inc d))))))      ; try with a bigger d

(defn get-max-prime-fact [num cur limit]
  (if (> cur limit)
    num
    (if (= num cur)
      num
    (if (zero? (mod num cur))
      (get-max-prime-fact (/ num cur) cur limit)
      (get-max-prime-fact num (inc cur) limit)))))

(defn max-prime [num]
  (let [limit (long (Math/sqrt num)) ]
    (get-max-prime-fact num 2 limit)))


