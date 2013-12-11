require 'csv'

class SaleReader

	def self.get_sales(file_name)
		@sales = []
		CSV.foreach(file_name, headers: true) do |row|
			@sales << Sale.new(row["last_name"],row["gross_sale_value"])
		end
		@sales
	end

end