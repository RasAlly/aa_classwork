class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{|hash, k| hash[k] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(str)
        @teachers << str
    end

    def enroll(str)
        if @students.length < @student_capacity
            @students << str
            true
        else
            false
        end
    end

    def enrolled?(str)
        @students.include?(str)
    end

    def student_to_teacher_ratio
       ratio =  @students.length / @teachers.length
        ratio.floor
    end

    def add_grade(str, num)
        if enrolled?(str)
            @grades[str] << num
            true
        else
            false
        end
    end

    def num_grades(str)
        @grades[str].length
    end

    def average_grade(str)
        if (enrolled?(str) == false) || (@grades[str].length < 1)
           return nil
        end
        sum = @grades[str].inject{|sum, n| n + sum}
        average = sum / @grades[str].length
        average.floor
    end
end
