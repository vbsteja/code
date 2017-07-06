R Language Basics:
	-> To take input use scan() method
		ex: data=scan()
	-> To create a vector use c() method
		ex: data=c(item1,item2,item3)
		ex:  data1=c(data,item4,item5,item6)
	-> To Assign a value to a variable we can use leftward,rightward and assignment operators
		ex: <-,->,= 
		ex: dataVariable=expression,dataVarible <- expression, expression -> dataVariable
	-> operators are as follows : + - * / ( )
		pi,x^y,sqrt(x),abs(x),factorial(x),log10(x),log2(x),log(x,base),exp(x),cos(x),tan(x),sin(x),acos(x),atan(x),asin(x)
	-> reading from file using file='filename' as a parameter in scan function, or we can use file.choose() to dynamically choose a filename
		ex: randata=scan(file='sample.txt', what='char', sep=',')
		randata=scan(file.choose(), what='char', sep=',')
	-> getwd()  To get the current working directory.
	-> setwd('newpath') to change the path to current working directory

	-> ls() To list all the variables used in the current session
	->rm(variables) To remove the objects loaded in the current session
	-> as.integer(obj),as.number(obj),as.character(obj),
	
	-> str(dataframe)
	->dim(dataframe)
	->summary(dataframe)
