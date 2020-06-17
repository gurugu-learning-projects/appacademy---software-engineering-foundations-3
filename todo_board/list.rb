require "./item.rb"

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def [](index)
    if valid_index?(index)
      @items[index]
    else
      nil
    end
  end

  def add_item(title, deadline, description="")
    if Item.valid_date?(deadline)
      @items << Item.new(title, deadline, description)
      true
    else
      false
    end
  end

  def size
    @items.length
  end

  def valid_index?(index)
    index >= 0 && index < self.size
  end

  def swap(index_1, index_2)
    if self.valid_index?(index_1) && self.valid_index?(index_2)
      @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
      true
    else
      false
    end
  end

  def priority
    @items.first
  end

  def print
    divider = "-------------------------------------------------------"
    item_title = "Item                 "

    puts divider
    puts @label.upcase.center(divider.length)
    puts divider
    puts "Index | Item                 | Deadline   | Status"
    puts divider

    @items.each_with_index do |item, idx|
      puts "#{idx + 1}     | #{item.title.ljust(item_title.length)}| #{item.deadline} | #{item.done ? "done" : "in progress"}"
    end

    puts divider
  end

  def print_full_item(index)
    if self.valid_index?(index)
      item = @items[index]

      puts "------------------------------------------"
      puts item.title
      puts item.deadline

      if item.done
        puts "Status: done"
      else 
        puts "Status: in progress"
      end

      if item.description.length > 0
        puts item.description
      end

      puts "------------------------------------------"
    end
  end

  def print_priority
    self.print_full_item(0)
  end

  def up(index, amount = 1)
    if self.valid_index?(index)
      if index > 0 && amount > 0
        self.swap(index, index - 1)
        self.up(index - 1, amount - 1)
      end
    else
      false
    end
  end

  def down(index, amount = 1)
    if self.valid_index?(index)
      if index < self.size - 2 && amount > 0
        self.swap(index, index + 1)
        self.down(index + 1, amount - 1)
      end
    else
      false
    end
  end

  def sort_by_date!
    @items.sort_by! {|item| item.deadline}
  end

  def toggle_item(index)
    if self.valid_index?(index)
      self[index].toggle
    else
      print "Enter valid index"
    end
  end

  def remove_item(index)
    if !self.valid_index?(index)
      false
    else
      @items.slice!(index)
      true
    end
  end

  def purge
    @items.each_with_index do |item, idx|
      if item.done
        self.remove_item(idx)
      end
    end
  end
end