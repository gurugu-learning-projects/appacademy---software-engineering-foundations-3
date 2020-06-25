class Item
  attr_accessor :title, :description
  attr_reader :deadline, :done

  def initialize(title, deadline, description)
    @title = title

    if !Item.valid_date?(deadline)
      raise "Invalid date"
    end

    @deadline = deadline
    @description = description
    @done = false
  end

  def self.valid_date?(date_string)
    parts = date_string.split("-")
    year, month, day = parts.map(&:to_i)

    return false if parts.length != 3

    year > 0 && month >= 1 && month <= 12 && day >= 1 && day <= 31
  end

  def deadline=(new_deadline)
    if !Item.valid_date?(new_deadline)
      raise "Invalid date"
    else
      @deadline = new_deadline
    end
  end

  def toggle
    @done = !@done
  end
end