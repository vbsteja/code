
//import java.io.Exception;
public class Practice{

     public static void main(String []args){
        //System.out.println("Hello World");
        try{
        args=null;
        args[0]="1";
        System.out.println(args[0]);
    }
    catch(Exception e){System.out.println("Exception");}
    //catch(NullPointerExcepton np){System.out.println("NPE");}
     }

}
