import java.util.Scanner;
class Employee
{
int id;
String name;
String position;
int salary;
}
public class EmployeeManagement
{
Employee employee[]=new Employee[100];
int count=0;
public void addemployee(Scanner sc)
{
Employee e=new Employee();
System.out.println("Enter ID:");
e.id=sc.nextInt();
sc.nextLine();
System.out.println("Enter name:");
e.name=sc.nextLine();
System.out.println("Enter Position:");
e.position=sc.nextLine();


System.out.println("Enter salary:");
e.salary=sc.nextInt();
employee[count]=e;
count++;
System.out.println("***Employee Added***");
System.out.println("Add");

}
public void viewemployee(Scanner sc)
{
for(int i=0;i<count;i++)
{
System.out.println("Id:"+ employee[i].id + ", Name: " + employee[i].name + ",position:"+employee[i].position + ", salary:" + employee[i].salary);
}
}
public void updateemployee(Scanner sc)
{
System.out.println("Enter ID:");
int id=Scanner.nextInt;
int Count=0;
for(Employee 
System.out.println("Update");

}
public void deleteemployee(Scanner sc)
{
System.out.println("Delete");
}

public void run()
{
Scanner sc=new Scanner(System.in);
int choice;
do
{
System.out.println("Hello");
System.out.println("1. Add Employee");
System.out.println("2. View Employee");
System.out.println("3. Update Employee");
System.out.println("4. Delete Employee");
System.out.println("5.Exit");
System.out.println("Enter your choice");
choice=sc.nextInt();
switch (choice)
{

case 1:
addemployee(sc);
break;
case 2:
viewemployee(sc);
break;
case 3:
updateemployee(sc);
break;
case 4:
deleteemployee(sc);
break;
case 5:
System.out.println("Exit");
break;
default:
System.out.println("Invalid choice");
}
}
while(choice!=5);
}
public static void main(String args[])
{
EmployeeManagement e=new EmployeeManagement();
e.run();
}
}




