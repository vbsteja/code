(ns practice.eulers
  (:gen-class))
;; Euler Prime Factor
;;algorithm
;divide and conquerr.


(defn divide? [n x]
  (zero? (mod n x)))

(defn max_prime_fact [n] ;function args n
  (loop [x 2 m n] ;start loop and initialize variables x,m
    (cond
      (= x m) m
      (divide? m x)(recur x (/ m x))
      :else (recur (inc x) m))))

(defn reverse-int [n]
    (loop [m n acc 0]
	(cond
       	    (zero? m) acc
	    :else (recur (quot m 10) (+ (* acc 10) (mod m 1))))))

(defn palindrome? [n]
    (= n (reverse-int n)))

(defn euler-4 [lower-limit upper-limit]
    (loop [p upper-limit q upper-limit largest 0]
	(let [candidate (* p q)]
    	    (cond
		(< p lower-limit) largest
		(< candidate largest) largest
		(< lower-limit q) (recur (dec p) (dec p) largest)
                (palindrome? candidate)
  	  	    (if (> candidate largest)
			(recur p (dec q) candidate))
		:else (recur p (dec q) largest)))))


(defn factorial
  ([^long n]
    (factorial n 1))
  ([n acc]
    (if (<= n 1)
      acc
      (factorial (dec n) (* acc n)))))

(defn ^double get_facto
	"this method will return the factorial  of n"
	[n]
  (loop [m n fac 1]
	     (if (zero? m)
        fac
	           (recur (dec m) (* m fac)))))
(defn explode-to-digits [number]
        (map #(- (int %) (int \0)) (str number)))
	  
(defn get_zero
	"this method will give you the trailing zeros in the given number"
	[n]
	(let [m n]
	     (count (seq (take-while zero? (reverse (explode-to-digits m)))))))


(defn -main[]
  (println "enter the input  ")
  (print (time(get_zero(bigint (get_facto(bigint (read))))))))
;;
