package apliestadia;
import java.sql.*;
public class APLIEstadia {

    public static void main(String[] args) {
        // TODO code application logic here
    
    try{
    Connection Estadia2021=DriverManager.getConnection("jdbc:mariadb://localhost:3306/venta_estadia","root","H0lamaria+");
    CallableStatement miBase=Estadia2021.prepareCall("{call SP_GETTicket}");
    
    ResultSet rs=miBase.executeQuery();
    while(rs.next()){
        System.out.println(rs.getString(1)+ ""+ rs.getString(2)+ ""+ rs.getString(3));
    }
    rs.close();
    
    }catch(Exception e){
        
        
    }
    
    }
    
}
