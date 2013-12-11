class SalesController < ApplicationController

  def index
    # make your sales objects available to the correlating view here
    @employee_sales = []
    @sales = SaleReader.get_sales('app/models/sales.csv')
    @employees = EmployeeReader.get_employees('app/models/employees.csv')
    @sales.each do |sale|
    	@employees.each do |employee|
    		if sale.last_name == employee.last_name
    			commission = (employee.commission*employee.total_sales) if employee.class.to_s == "CommissionSalesPerson"
    			@employee_sales << [first_name: employee.first_name, last_name: sale.last_name, amount: sale.amount, commission: commission]
    		end
    	end
    end
  end

end
