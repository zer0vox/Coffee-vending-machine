OBJECTIVE: To design and simulate working of a coffee vending machine using Xilinx ISE Simulator

THEORY
A vending machine is an automated machine that dispenses items like snacks, drinks, and other goods when you insert money or use a credit card. They're often found in places like offices, schools, hospitals, and airports. They are a convenient way to buy a quick snack or drink.
Here's how they work:
1. Choose an item: Look at the pictures or buttons on the machine to find what you want.
2. Pay: Insert cash, a credit card, or use a mobile payment app.
3. Collect your item: The machine will dispense your item into a tray or slot.
System Design
As discussed above, vending machine has three core states choose an item, pay money and collect item. Utilizing these, we develop three states our coffee vending machine can have, namely, idle, put_money and coffee_out. Also, the cash that is inserted may be of different denominations. To handle this, we assign different states according to the cash input. 
Suppose that the coffee vending machine dispenses coffee at Rs. 20. Then for this, several combinations may occur. Some of the possible occurrences are:
1.	entering no money
2.	putting 10 followed by another 10 -> getting the coffee
3.	putting 10 followed by 20 -> receiving change -> getting a coffee
4.	putting 10 followed by 50 -> receiving change -> getting a coffee
5.	putting 20 and getting the coffee
6.	putting 50 => receiving change => getting a coffee.
Thus, for each cash denomination, we define additional states in_1, in_2, in_3, in_5, in_6 and for change of Rs. 10, state change_1.





States
1.	put_money: this is the first state after ‘idle’, here the customer puts in the cash.
2.	in_5: If the customer put 50, the machine moves to this state. Pay attention that the machine gives back a 20 change without dispensing the coffee yet.
3.	change_1: after giving a 20 change for the customer who paid 50,we need to give back another 10 change. Here, in this state we do exactly that. again, note that the coffee still has not been dispensed yet.
4.	in_1, in_3, in_6: we get to those states depending on the sum of money inserted by the customer.
5.	coffee_out: dispensing out the coffee.
Input
cashIn: the cash provided to vending machine
clk: clock that drives fsm of vending machine
rstn: a signal that resets the fsm to it’s initial state
Output
coffee_out: coffee is dispensed
cashOut: change money is provided to the user
Assumptions
1.	In this design we will ignore the capacity of the stock, which means, we’ll assume that there will always be can in the vending machine.
2.	Also, we can assume that only one action could be made in every “clock cycle” or state.
3.	first give back the change then dispense coffee. 
FSM
The Finite State Machine designed on the basis of above given states, inputs and outputs as well as assumptions is shown below:
 

 
