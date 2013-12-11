class CommissionSalesPerson < Employee
	attr_reader :total_sales, :commission

	def initialize(first_name, last_name, base_salary, commission)
		super(first_name,last_name,base_salary)
		@commission = commission.to_f
		get_sales(last_name)
	end

	def get_sales(last_name)
		@total_sales = 0
		employee_sales = SaleReader.get_sales('app/models/sales.csv')
		employee_sales.each do |sale|
			@total_sales += sale.amount.to_f if sale.last_name == last_name
		end
	end

	def gross_salary_per_month
		(@base_salary/12) + ((@commission * @total_sales))
	end

	def net_pay_per_month
		super
	end

end