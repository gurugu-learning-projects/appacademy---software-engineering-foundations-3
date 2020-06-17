# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length > 0
      minmax = self.minmax

      return minmax[1] - minmax[0]
    end

    nil
  end

  def average
    if self.length > 0
      return self.sum / (self.length * 1.0)
    end

    nil
  end

  def median
    if self.length > 0
      sorted = self.sort

      if self.length.even?
        return (sorted[self.length / 2 - 1] + sorted[self.length / 2]) / 2.0
      else
        return sorted[self.length / 2]
      end
    end

    nil
  end

  def counts
    counting = Hash.new(0)

    self.each { |ele| counting[ele] += 1 }

    counting
  end

  def my_count(val)
    self.select { |ele| ele == val }.length
  end

  def my_index(val)
    self.each_with_index do |ele, idx|
      return idx if val == ele
    end

    nil
  end

  def my_uniq
    unique = []

    self.each { |ele| unique << ele if !unique.include?(ele) }

    unique
  end

  def my_transpose
    transposed = []

    (0...self.length).each do |num1|
      transposed << []
      (0...self.length).each do |num2|
        transposed[num1] << self[num2][num1]
      end
    end

    transposed
  end
end
