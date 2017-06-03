(ns data.g)
(defn -main
    "this is a sample game algorithms"
    []
    (print "Hello world..."))
(def xf (comp (filter odd?) (map inc) (take 5)))

(defn my-comp
    [& all-fns]
    (reduce
        (fn [acc-fn cur-fn]
            (fn[& args]
               (acc-fn (apply cur-fn args)))
            identity
                all-fns)))
(def -xf (comp (filter odd?) (map inc) (take 5)))
(print "hello")
