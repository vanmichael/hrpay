class QuotaSalesPerson < Employee

	def initialize(first_name, last_name, base_salary, bonus, sales_quota)
		super(first_name,last_name,base_salary)
		@bonus = bonus.to_f
		@sales_quota = sales_quota.to_f
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
		if @total_sales >= @sales_quota
			(@base_salary/12) + (@bonus)
		else
			@base_salary/12
		end
	end

	def net_pay_per_month
		super
	end

end