require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    self.salaries.has_key?(title)
  end

  def >(other_startup)
    self.funding > other_startup.funding
  end

  def hire(employee_name, title)
    if self.valid_title?(title)
      new_employee = Employee.new(employee_name, title)
      @employees << new_employee
    else
      raise "Title is invalid"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]

    if @funding >= salary
      employee.pay(salary)
      @funding -= salary
    else
      raise "Not enough funding"
    end
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee) }
  end

  def average_salary
    sum = 0

    @employees.each do |employee|
      sum += @salaries[employee.title]
    end

    sum / (@employees.length * 1.0)
  end

  def close
    @employees = []
    @funding = 0
  end
  
  def acquire(other_startup)
    # add funding
    @funding += other_startup.funding

    # merging salaries
    other_startup.salaries.each do |title, salary|
      if !@salaries.has_key?(title)
        @salaries[title] = salary
      end
    end

    # hire employees
    @employees += other_startup.employees

    # closer other startup
    other_startup.close()
  end
end
