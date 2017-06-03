(ns practice.prime
  (:gen-class))


(defn parse-int [s]
   (Integer. (re-find  #"\d+" s )))

(defn split-on-space [s]
    	(clojure.string/split s #"\s+"))
  
;(def n );read second string of input

 
(defn prime[n]
	(for [x n
     :let [y x st ""]
     :when ( = 1 (count (for [l n 
		:when (= 0 ( rem y l))] false)))]
	(str st y)))
(defn get_input[]
	(let [s (parse-int(read-line)) n (vec (map parse-int (split-on-space  (read-line))))]
(print  (prime  n))))
(get_input)
(defn -main[])
;(print prime? n)
 
(defn strip [coll chars]
  (apply str (remove #((set chars) %) coll)))
