object Fib extends App{
print(fib5(20000))
}
def fib5( n : Int) : Int = { 
  def fib_tail( n: Int, a:Int, b:Int): Int = n match {
    case 0 => a 
    case _ => fib_tail( n-1, b, (a+b)%1000000 )
  }
  return fib_tail( n%1500000, 0, 1)
}
