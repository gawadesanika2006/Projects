#include <iostream> 
#include <cstdlib> 
#include <ctime> 
using namespace std; 
string getComputerChoice() 
{ 
int choice = rand() % 3; // 0, 1, or 2 
if (choice == 0) return "rock"; 
else if (choice == 1) return "paper"; 
else return "scissors"; 
} 
string getUserChoice()  
{ 
string choice; 
cout << "Enter rock, paper, or scissors: "; 
cin >> choice; 
return choice; 
} 
string determineWinner(string user, string computer) 
{ 
if (user == computer) return "It's a tie!"; 
else if ((user == "rock" && computer == "scissors") || 
(user == "scissors" && computer == "paper") || 
(user == "paper" && computer == "rock"))  
{ 
else  
{ 
} 
return "You win!"; 
}  
return "Computer wins!"; 
} 
int main()  
{ 
srand(time(0)); // Seed random number generator 
string userChoice = getUserChoice(); 
string computerChoice = getComputerChoice(); 
cout << "Computer chose: " << computerChoice << endl; 
cout << determineWinner(userChoice, computerChoice) << endl; 
return 0; 
}