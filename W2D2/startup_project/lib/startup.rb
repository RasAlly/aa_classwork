require "employee"

class Startup  
        attr_reader :name, :funding, :salaries, :employees
    def initialize(name, number, hash)
        @name = name
        @funding = number
        @salaries = hash
        @employees = []
    end

    def valid_title?(str)
        @salaries.key?(str)
    end

    def >(startup_2)
        self.funding > startup_2.funding
    end

    def hire(employee, title)
        if valid_title?(title)
            @employees << Employee.new(employee, title)
        else
           raise_error
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
            raise_error
        end
    end

    def payday
        employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        sum = 0 
        @employees.each do |emply|
            sum += salaries[emply.title]
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each do |title, salary|
            if salaries[title] == nil
                salaries[title] = salary
            end
        end
        other_startup.employees.each do |ele|
            employees << ele
        end
        other_startup.close 
    end
end
