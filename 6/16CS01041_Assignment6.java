import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.Calendar;
import java.util.Scanner;
public class oraclejdbc
{
    public static void main(String[] argv) throws SQLException
    {
        try
        {
                Class.forName("oracle.jdbc.driver.OracleDriver");
        } 
        catch(ClassNotFoundException e)
        {
                e.printStackTrace();
                return;
        }

        System.out.println("Oracle JDBC Driver Registered!");

        Connection connection = null;
        try
        {
                connection = DriverManager.getConnection(
                                "jdbc:oracle:thin:@localhost:1521:madhav", "c##madhav",
                                "password");
        }
        catch (SQLException e)
        {
                System.out.println("Connection Failed! Check output console");
                e.printStackTrace();
                return;
        }

        if (connection != null)
        {
                System.out.println("Connection established!");
        }
        else
        {
                System.out.println("Failed to make connection!");
        }

        PreparedStatement pstmt = null;
        try {
           String SQL = "select * from jobs where min_salary<(select salary from employees where employee_id=?)";
           pstmt = connection.prepareStatement(SQL);
           System.out.print("\nQuestion 1\nEnter the employee_id: ");
           Scanner in = new Scanner(System.in);

           int a = in.nextInt(); 
           pstmt.setInt(1, a);
           ResultSet rs=pstmt.executeQuery();
           String job_id,job_title;
           int min_sal,max_sal;
           while(rs.next())
           {
               job_id=rs.getString("job_id");
               job_title=rs.getString("job_title");
               min_sal=rs.getInt("min_salary");
               max_sal=rs.getInt("max_salary");

               System.out.println("job_id: "+job_id+"\njob_title: " +job_title+"\nmin_sal: "+min_sal+"\nmax_sal: "+max_sal+"\n");
           }
        }
        catch (SQLException e) {
            System.out.println("prepareStatement failed "+e);
            return;
        }
        finally {
           pstmt.close();
        }


        CallableStatement s=null;
        try
        {
             s=connection.prepareCall("{call proc(?, ?, ?, ?)}");
             Scanner scanner=new Scanner(System.in);
             System.out.print("Question 2\nEnter Employee_id: ");
             int a=scanner.nextInt();
             s.setInt(1,a);
             s.registerOutParameter(2, java.sql.Types.VARCHAR);
             s.registerOutParameter(3, java.sql.Types.VARCHAR);
             s.registerOutParameter(4, java.sql.Types.VARCHAR);

             s.execute();
             System.out.println("Name: "+s.getString(2)+" "+s.getString(3));
             System.out.println("Department Name: "+s.getString(4));

        }
        catch(SQLException e)
        {
            System.out.println("Could not prepareCall "+e);
        }
        finally
        {
            s.close();
        }


        System.out.println("\nQuestion 3");
        PreparedStatement p=null;
        try
        {
            p=connection.prepareStatement("select job_title, first_name, last_name from employees e, jobs j where e.job_id=j.job_id and hire_date>? and exists(select * from employees where employee_id=e.manager_id and department_id=?)");

            Scanner sc=new Scanner(System.in);

            System.out.print("Enter year: ");
            int year = sc.nextInt();
            System.out.print("Enter month: ");
            int month = sc.nextInt();
            System.out.print("Enter day: ");
            int day = sc.nextInt();
            Calendar cal = Calendar.getInstance();
            cal.set(Calendar.YEAR, year);
            cal.set(Calendar.MONTH, month - 1); // <-- months start at 0.
            cal.set(Calendar.DAY_OF_MONTH, day);
            java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
            p.setDate(1, date);
            System.out.print("Enter Department_id: ");
            int dep_id=sc.nextInt();
            p.setInt(2, dep_id);

            //p.execute();
            ResultSet r=p.executeQuery();//getResultSet();
            while(r.next())
            {
                System.out.println("Job_Title: "+r.getString(1)+"\nName: "+r.getString(2)+" "+r.getString(3));
                System.out.println("");
            }
        }
        catch(SQLException e)
        {
                    System.out.println(e);
        }
        finally
        {
            p.close();
        }


        System.out.println("Question 4");
        try
        {
            Scanner sca=new Scanner(System.in);
            PreparedStatement preps=connection.prepareStatement("update employees set salary=salary*1.05, job_id=? where employee_id=?");
            System.out.print("Enter employee_id: ");
            preps.setInt(2,sca.nextInt());
            System.out.print("Enter new job_id: ");
            preps.setString(1,sca.next());

            System.out.println("No. of rows affected: "+preps.executeUpdate());
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }


        System.out.println("\nQustion 5");
        try
        {
            Statement statement = connection.createStatement();
            ResultSet res = statement.executeQuery("select d.department_id, department_name, sum(salary) from employees e, departments d where e.department_id=d.department_id group by d.department_id, department_name having sum(salary)>100000");
            try (FileWriter fw = new FileWriter("Q5Output.txt"))
            {
                fw.write("DeptNo\tDeptName\tTotalSalary\n\n");
                while(res.next())
                {
                    fw.write(res.getInt(1)+"\t"+res.getString(2)+"\t"+res.getInt(3)+"\n");
                }
                fw.close();
            }
            statement.close();
        }
        catch(IOException | SQLException e)
        {
            System.out.println(e);
        }


        System.out.println("\nQustion 6");
        try (FileWriter fw = new FileWriter("Q6Output.txt"))
        {
            fw.write("Dept Name\tMgr_Name\tEmployee(s)\tSalary\n\n");
            PreparedStatement s1;
            ResultSet r1;
            try (Statement st = connection.createStatement())
            {
                ResultSet res = st.executeQuery("select d.department_id, department_name, first_name, last_name from departments d, employees e where d.manager_id=e.employee_id");
                String department_name, manager_name;
                int did;
                float sum;

                while(res.next())
                {
                    did =res.getInt(1);
                    sum=0;
                    department_name=res.getString(2);
                    manager_name=res.getString(3)+" "+res.getString(4);
                    fw.write(department_name+"\t"+manager_name+"\t");
                    s1=connection.prepareStatement("select first_name, last_name, salary from employees where department_id=?");
                    s1.setInt(1,did);
                    r1 = s1.executeQuery();
                    while(r1.next())
                    {
                        sum+=r1.getFloat(3);
                        fw.write(r1.getString(1)+" "+r1.getString(2)+"\t"+ r1.getFloat(3)+"\n\t\t\t\t");
                    }
                    fw.write("\n\t\t\t\t--------------------------------------\nTotal Sal\t\t\t\t\t"+sum+"\n\n");
                }
            }
            fw.close();
        }
        catch(IOException | SQLException e)
        {
            System.out.println(e);
        }    
    }
}