class Account

	attr_accessor :balance, :errors

	def initialize(balance = 0)
		@balance = balance
		@errors = []
	end
	
	def deposit(quantity)
		@balance += quantity
	end
	
	def withdraw(quantity)
		if quantity <= balance
			@balance -= quantity
			@errors.clear
		else
			@errors.push('Not enough money error')
			raise 'Sorry, your account does not have enough money.'
		end
	end

end