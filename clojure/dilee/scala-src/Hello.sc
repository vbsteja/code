class Person{
  var age = 0;
  def setAge(age_ :Int): Unit ={
    this.age = age_
  }
  def getAge(): Int ={
    return this.age
  }
}
object Hello{
  def main(args: Array[String]): Unit = {
    print("Hello there")
    var p =new Person()
    p.setAge(20)
    print(p.getAge())
  }
}

