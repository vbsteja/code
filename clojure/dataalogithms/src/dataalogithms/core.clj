(ns dataalogithms.core)
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
  (apply str header (interpose  "\n" row )))
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


