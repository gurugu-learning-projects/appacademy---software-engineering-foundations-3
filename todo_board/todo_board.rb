require "./list.rb"

class TodoBoard
  def initialize(label)
    @list = List.new(label)
  end

  def get_command
    print "\nEnter command:"
    cmd, *args = gets.chomp.split(" ")

    case cmd
    when "mktodo"
      @list.add_item(*args)
      return true
    when "up"
      args.map!(&:to_i)
      @list.up(*args)
      return true
    when "down"
      args.map!(&:to_i)
      @list.down(*args)
      return true
    when "swap"
      args.map!(&:to_i)
      @list.swap(*args)
      return true
    when "sort"
      @list.sort_by_date!
      return true
    when "priority"
      @list.print_priority
      return true
    when "print"
      if args.length > 0
        arg_to_i = args[0].to_i - 1
        @list.print_full_item(arg_to_i)
      else
        @list.print
      end
      return true
    when "toggle"
      arg_to_i = args[0].to_i - 1
      @list.toggle_item(arg_to_i)
      return true
    when "rm"
      arg_to_i = args[0].to_i - 1
      @list.remove_item(arg_to_i)
      return true
    when "purge"
      @list.purge
      return true
    when "quit"
      return false
    else
      print "Sorry, this command is not recognized."
      return true
    end
  end

  def run
    result = self.get_command

    if result
      self.run
    end
  end
end