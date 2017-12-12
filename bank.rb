require_relative 'account'
require_relative 'transfer'

class Bank

	attr_accessor :name, :accounts_list, :transfers_history_list
	
	def initialize(bank_name)
		@name = bank_name
		@accounts_list = []
		@transfers_history_list = []
	end
	
	def create_account(balance = 0)
		account = Account.new(balance)
		@accounts_list.push(account)
	end
	
	def deposit(quantity, account_number)
		@accounts_list[account_number].deposit(quantity)
	end
	
	def withdraw(quantity, account_number)
		begin
			@accounts_list[account_number].withdraw(quantity)
		rescue Exception => e  
			puts e.message
		end
	end
	
	def log_transfer(transfer)
		@transfers_history_list.push(transfer)
	end
	
	def print_transfers_history
		puts "---> #{@name} transfers history <---"
		@transfers_history_list.each do |t|
			puts t.print_transfer
		end
		puts "---> END of #{@name} transfers history <---"
	end

end