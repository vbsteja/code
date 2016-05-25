public class HelloWorld{

     public static void main(String []args){
        //System.out.println("Hello World");
        new HelloWorld().go();
     }
     public void go(){
         Runnable r=new Runnable(){
             public void run(){
                 Systsem.out.println("Foo");
             }
         };
         Thread t=new Thread(r);
         t.start();
         t.start();
     }
}
