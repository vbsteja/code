
class Parsing {
	def main1(a: String)={
		println(a)
	}

}
object Hello{
	def prime(a:Int,numList :Array[String]):Boolean={
		var count = 0;
		var i = 0;
		for(i <- numList) {
			if(a % i.toInt == 0){
				count+=1;
			}
		}
		if(count > 1){
			return false
		}
		else
		{
			return true
		}

	}

	def main(args: Array[String]) = {
		//println("Hello World this is scala")
		var n=Console.in.readLine()
		val numList=Console.in.readLine().split(" ");
		var a=0;
		var output:String="";
		for( a <- numList if prime(a.toInt,numList)
		) {
			output=output+a+" "
		}
		println(output)
		//parseString("Hello")
		//Parsing p=new Parsing();

	}

	def me(a: Int) = {
		var n=Console.in.readLine()
		var k=List(1,3,4,5)


	}
}
