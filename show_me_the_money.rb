require_relative 'bank'
require_relative 'transfer'

puts '-----------------------------------
--- START OF PART 1 TEST SCRIPT ---
-----------------------------------'

puts '-> Create Bank'
b1 = Bank.new('Barclays')
b2 = Bank.new('Santander')
puts "-> Create account in bank 1 with 20.000"
b1.create_account(20000)
puts "Bank 1 - Account 1: #{b1.accounts_list[0].balance}"
puts "-> Deposit 10.000"
b1.deposit(10000, 0)
puts "Bank 1 - Account 1: #{b1.accounts_list[0].balance}"
puts "-> Withdraw 1.000"
b1.withdraw(1000, 0)
puts "Bank 1 - Account 1: #{b1.accounts_list[0].balance}"
puts "-> Withdraw 30.000"
b1.withdraw(30000, 0)
puts "Bank 1 - Account 1: #{b1.accounts_list[0].balance}"
puts "-> Create account in bank 1 with 5.000"
b1.create_account(5000)
puts "Bank 1 - Account 2: #{b1.accounts_list[1].balance}"
puts "-> Transfer 200 from bank 1 - account 1 to bank 1 - account 2"
t1 = Transfer.new(0, 1, b1, b1, 200)
t1.order_transfer
puts "-> Bank 1 transfers history"
b1.print_transfers_history
puts "Bank 1 - Account 1: #{b1.accounts_list[0].balance}"
puts "Bank 1 - Account 2: #{b1.accounts_list[1].balance}"
puts "-> Create account in bank 2 with 1.000"
b2.create_account(1000)
puts "-> Transfer 200 from bank 1 - account 1 to bank 2 - account 1"
t2 = Transfer.new(0, 0, b1, b2, 200)
t2.order_transfer
puts "Bank 1 - Account 1: #{b1.accounts_list[0].balance}"
puts "Bank 1 - Account 2: #{b1.accounts_list[1].balance}"
puts "Bank 2 - Account 1: #{b2.accounts_list[0].balance}"

puts '-----------------------------------
---- END OF PART 1 TEST SCRIPT ----
-----------------------------------'

puts '-----------------------------------
--- START OF PART 2 TEST SCRIPT ---
-----------------------------------'

# Jim's bank
bank_a = Bank.new('Bank A')
bank_a.create_account(30000)
puts "Bank A - Jim's account before: #{bank_a.accounts_list[0].balance}"
# Emma's bank
bank_b = Bank.new('Bank B')
bank_b.create_account
puts "Bank B - Emma's account before: #{bank_b.accounts_list[0].balance}"
# Jim's transfer to Emma
puts "-"
puts "Jim transfers 20.000 to emma with the help of a transfer agent"
t_jim_to_emma = Transfer.new(0, 0, bank_a, bank_b, 20000)
t_jim_to_emma.order_transfer_by_agent
puts "-"
puts "Bank A - Jim's account after: #{bank_a.accounts_list[0].balance}"
puts "Bank B - Emma's account after: #{bank_b.accounts_list[0].balance}"
puts "-"
puts "Transfers history"
puts "-"
bank_a.print_transfers_history
bank_b.print_transfers_history

puts '-----------------------------------
---- END OF PART 2 TEST SCRIPT ----
-----------------------------------'