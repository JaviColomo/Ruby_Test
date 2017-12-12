# Ruby_Test
Test for ruby and git

* **Author: _Javier Colomo Suárez_**
* **Date: _12-12-2017_**

1. **Class description and methods**
   - **Account**: Represents a bank account owned by some person.
     - Initializer:
     > Creates an object of the class "Account" and can optionally receive a parameter meaning the account balance.
     - deposit:
     > Allows to deposit an amount of money into the account. Receives a sum of money as parameter.
     - withdraw:
     > Allows to withdraw an amount of money from the account. Reveives a sum of money as parameter. Raises an error if the account has not money enough.
   - **Bank**: Represents a bank and holds multiple accounts and a history of transfers.
     - Initializer:
     > Creates an object of the class "Bank" receiving a bank name as parameter.
     - create_account:
     > Creates an account stored in the bank, and can optionally receive a parameter meaning the account balance.
     - deposit:
     > Allows to deposit an amount of money into one of the accounts in the bank. Receives the account number and a sum of money as parameter.
     - withdraw:
     > Allows to withdraw an amount of money from one of the accounts in the bank. Receives the account number and a sum of money as parameter. Handles if the account raises a not enough money error.
     - log_transfer:
     > Saves a transfer object in the transfers history for the bank.
     - print_transfers_history:
     > Prints the transfers history.
   - **Transfer**: Represents a transfer and saves the information for origin and destination bank and account, as well as transfer type and the quantity of money.
     - Initializer:
     > Creates an object of the class "Transfer" receiving all the related data (origin and destination bank and account, and quantity of money).
     - order_transfer:
     > Orders the transfer having in mind if the origin and destination bank is the same. If they are, the transfer is done for free and with no chance of failure. Finally, saves the transfer in the history of the bank. If they are not, the transfer costs 5 € as commissions, has a 30% chance of failure, and has a limit of 1000 €. Finally, saves the transfer in both origin and destination banks.
     - order_transfer_by_agent:
     > Generates a transfer for each 1000 € in order not to overpass the limit, and pays the commissions only once if the transfer is between diferent banks. Moreover, there is no chance of failure.
     - print_transfer:
     > Prints the information of a transfer.
   - **Test script "show_me_the_money.rb"**: The script allows to test the classes and structure explained above.
     - Part 1:
     > Tests the designed classes and structure by creating some banks and accounts, and making transfers between them. Also prints a transfer history.
     - Part 2:
     > Reproduces the proposed situation in the part 2 of the test.
2. **Test questions proposed in the task**
   - How would you improve your solution?
   > It would be useful to save the accounts in the bank as a map instead of as an array, so they could be referenced by some owner data like DNI. 
   - How would you adapt your solution if transfers are not instantaneous?
   > A possible solution is to add some delay time in the process of a transfer, after withdrawing the money from the origin account, and before depositing it in the destination account. "sleep" function could be used for this purpose.
   ```
   sleep(10)
   ```
