(defvar *db* nil)

(defun make-cd(title author price ripped)
	(list :title title :author author :price price :ripped ripped))

(defun add-record(cd)
	(push cd *db*))

(defun dump-db()
	(format t "~{~{~a:~10t~a~%~}~%}" *db*))

(defun prompt-read(prompt)
	(format *query-io* "~a:" prompt)
	(force-output *query-io*)
	(read-line *query-io*))

(defun prompt-for-cd()
	(make-cd
		(prompt-read "Title")
		(prompt-read "Author")
		(parse-integer(prompt-read "Price"))
		(prompt-read "Ripped?[Y/n]")))

(defun add-cds()
	(loop(add-record(prompt-for-cd))
		(if (not (y-or-n-p "Another?[y/n]"))(return))))

(defun  save-db(file-name)
	(with-open-file(out file-name
		:direction :output
		:if-exists :supersede)
		(with-standard-io-syntax
			(print *db* out))))

(defun load-db(file-name)
	(with-open-file(in file-name)
		(with-standard-io-syntax)
		(setf *db* (read in))))

(defun select-by-artist(artist)
	(remove-if-not
		#'(lambda(cd)(equal (getf cd :artist) artist) *db*)))

(defun select (selector-fn)
	(remove-if-not selector-fn *db*))

(defun artist-selector(artist)
	#'(lambda(cd) (equal (getf cd :artist)artist)))

(defun where(&key title artist price (ripped nil ripped-p))
	#'(lambda(cd)
		(and
			(if title(equal(getf cd :title) title) t)
			(if artist(equal(getf cd :artist)artist) t)
			(if price(equal(getf cd :price)price) t)
			(if ripped-p(equal(getf cd :ripped) ripped) t))))

(defun update(selector-fn &key title artist price (ripped nil ripped-p))
	(setf *db*
		(mapcar
			#'(lambda(row)
				(when funcall selector-fn row)
				(if title (setf (getf row :title) title))
				(if artist(setf (getf row :artist) artist))
				(if price (setf (getf row :price) price))
				(if ripped-p (setf (getf row :ripped) ripped))
				))))



(defun main()
	(print "1.add-record")
	(print "2.save-db")
	(print "3."))
(print "::Sample Cd DataBase::")
(add-cds)
(main)
