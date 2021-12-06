# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length < 1
        return nil
    else
        self.max - self.min
    end
  end

  def average
    if self.length == 0
        return nil
    end
    sum = self.inject{|sum, n| n + sum}
    average = sum.to_f / self.length
    average
    end

    def median
        if self.length == 0
            return nil
        end
        if self.length % 2 != 0
            sorted = self.sort
            return sorted[(sorted.length - 1) / 2.0]
        else
            sorted = self.sort
            sum = sorted[sorted.length / 2] + sorted[(sorted.length / 2) - 1]
            return sum / 2.0
        end
    end

    def counts
        count = {}
        self.each do |ele|
            if count[ele] == nil
                count[ele] = 1
            else
                count[ele] += 1
            end
        end
        count
    end

    def my_count(v)
        count = 0
        self.each do |ele|
            if ele == v
                count += 1
            end
        end
        count
    end

    def my_index(v)
        if self.include?(v) == false
            return nil
        end
        self.each_with_index do |ele, i|
            if ele == v
                return i
            end
        end
    end

    def my_uniq
        new_arr = []
        self.each do |ele|
            if !new_arr.include?(ele)
                new_arr << ele
            end
        end
        new_arr
    end

    def my_transpose
        transposed = Array.new(self[0].length){Array.new}
        p transposed
        self.each_with_index do |subarr, i|
            subarr.each_with_index do |ele, j|
             transposed[j] << ele
            end
        end
        transposed
    end


end
