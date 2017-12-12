require_relative 'bank'

class Transfer
    
    attr_accessor :origin_account, :destination_account, :origin_bank, :destination_bank, :type, :quantity
    
    def initialize(origin_account, destination_account, origin_bank, destination_bank, quantity, type = '')
        @origin_account = origin_account
        @destination_account = destination_account
        @origin_bank = origin_bank
        @destination_bank = destination_bank
        @type = type
        @quantity = quantity
    end
    
    def order_transfer(is_transfer_agent = false)
        if @origin_bank == @destination_bank
            @type = 'intra-bank'
            @origin_bank.withdraw(@quantity, @origin_account)
            unless @origin_bank.accounts_list[@origin_account].errors.any?
               @destination_bank.deposit(@quantity, @destination_account) 
            end
            @origin_bank.log_transfer(self)
        else
            @type = 'inter-bank'
            unless quantity > 1000
                @origin_bank.withdraw(@quantity, @origin_account)
                #Paying of commissions initially if orderer is not a transfer agent
                unless is_transfer_agent
                    @origin_bank.withdraw(5, @origin_account)
                end
                #Failure rate of 30%, transfer will get lost if this rate is 8, 9 or 10
                failure_rate = rand(1..10)
                unless !is_transfer_agent && (@origin_bank.accounts_list[@origin_account].errors.any? || failure_rate > 7)
                   @destination_bank.deposit(@quantity, @destination_account) 
                end
                @origin_bank.log_transfer(self)
                @destination_bank.log_transfer(self)
            else
               raise 'Sorry, inter-bank transfers cannot be higher than 1000 €.' 
            end
        end
    end
    
    def order_transfer_by_agent
        # Pay commission once
        unless @origin_bank == @destination_bank
            @origin_bank.withdraw(5, @origin_account)
        end
        if @quantity > 1000
            transfers_number = @quantity / 1000
            # Order transfers each 1000 to 1000
            transfers_number.times do |n|
               t = Transfer.new(@origin_account, @destination_account, @origin_bank, @destination_bank, 1000)
               t.order_transfer(true)
            end
        end
        # Order a transfer with the rest of the money below 1000
        rest_of_quantity = @quantity == 1000 ? 1000 : @quantity % 1000
        unless rest_of_quantity == 0
            t_rest = Transfer.new(@origin_account, @destination_account, @origin_bank, @destination_bank, rest_of_quantity)
            t_rest.order_transfer(true)
        end
    end
    
    def print_transfer
       "Origin account number: #{@origin_account} / Destination account number: #{@destination_account} / Origin bank: #{@origin_bank.name} / Destination bank: #{@destination_bank.name} / Transfer type: #{@type} / Amount: #{@quantity}" 
    end
    
end
