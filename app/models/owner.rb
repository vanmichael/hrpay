class Owner < Employee

	def initialize(first_name, last_name, base_salary, bonus, company_quota)
		super(first_name,last_name,base_salary)
		@bonus = bonus.to_f
		@company_quota = company_quota.to_f
		get_sales
	end

	def get_sales
		@total_sales = 0
		employee_sales = SaleReader.get_sales('app/models/sales.csv')
		employee_sales.each do |sale|
			@total_sales += sale.amount.to_f
		end
	end

	def gross_salary_per_month
		if @total_sales >= @company_quota
			(@base_salary.to_f/12) + (@bonus)
		else
			(@base_salary.to_f/12)
		end
	end

	def net_pay_per_month
		super
	end

end