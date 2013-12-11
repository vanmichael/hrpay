require 'csv'

class EmployeeReader

	def self.get_employees(file_name)
		employees = []
		CSV.foreach(file_name, headers: true) do |row|
			case row["salary_type"]
			when "commission" then employees << CommissionSalesPerson.new(row["first_name"],row["last_name"],row["base_salary"],row["commission"])
			when "quota" then employees << QuotaSalesPerson.new(row["first_name"],row["last_name"],row["base_salary"],row["bonus"],row["sales_quota"])
			when "owner" then employees << Owner.new(row["first_name"],row["last_name"],row["base_salary"],row["bonus"],row["company_quota"])
			else employees << Employee.new(row["first_name"],row["last_name"],row["base_salary"])
			end
		end
		employees
	end

end