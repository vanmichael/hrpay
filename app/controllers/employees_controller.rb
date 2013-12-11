class EmployeesController < ApplicationController

  def index
    # make your employee objects available to the correlating view here
    @employees = EmployeeReader.get_employees('app/models/employees.csv')
  end

end
