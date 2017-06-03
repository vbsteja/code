(ns data.core)
(require '[clojure.string :as str])

(defn foo
  "I don't do a whole lot."
  [x]
  (println "Hello " x))

(defn -main
  "i dont know what is happening here..."
  []
  (foo "surya"))

(defn make-csv
  [header row]
  (apply str header (interpose  "\n" row)))
(make-csv ["name" "age" "sex"] ["surya 24 M","teja 25 F"])

;; count the frequencies of the characters in the string

(frequencies (str/lower-case "An Adult all about A's "))

;;yelling or not? guess what

(defn yelling?
  "docstring"
  [s]
  (every? #(or (not (Character/isLetter %))
               (Character/isUpperCase %) ) s))

;;formating strings

(def me {:first-name "surya", :fav_lang "Clojure"})
(do
  (print "Hi My name is " (me :first-name) ", my favorite language is " (me :fav_lang) "\n"))

;;Formating in tabular format
(def employe [["surya" "teja" "10123024"] ["teja" "surya" "34234134"]])
(def header ["First Name" "Last Name" "EmployeeID"])

(defn tablify [row]
  (apply format "%-20s | %-20s | %-20s" row))

(->> (concat [header] employe)
     (map tablify)
     (mapv println))
;(use '[clojure.java.shell :only [sh]])
;(sh "ping" "google.com")

;(.isReachable (java.net.InetAddress/getByName "oreilly.com") 10)

(print (into [] ga/xf (range 1000)))
