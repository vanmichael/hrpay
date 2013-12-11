class Sale

	attr_reader :last_name, :amount

	def initialize(last_name, amount)
		@last_name = last_name
		@amount = amount
	end

end