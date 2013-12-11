class Employee

	attr_reader :first_name, :last_name, :base_salary

def initialize(first_name, last_name, base_salary)
		@first_name = first_name
		@last_name = last_name
		@base_salary = base_salary.to_f
	end

	def gross_salary_per_month
		(@base_salary.to_f/12).to_f
	end

	def net_pay_per_month
		0.70 * gross_salary_per_month
	end

end