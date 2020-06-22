require "./list.rb"

class TodoBoard
  def initialize()
    @lists = Hash.new()
  end

  def get_command
    print "\nEnter command:"
    cmd, *args = gets.chomp.split(" ")

    case cmd
    when "mklist"
      if args.length < 1
        print "Please write command as: mklist <new_list_label>"
        return true
      end

      list_name = args[0]
      @lists[list_name] = List.new(list_name)
    when "ls"
      divider = "------------------------------------------"
      puts divider
      puts "LISTS".center(divider.length)
      puts divider
      @lists.each do |label, list|
        puts label
      end
      puts divider
      return true
    when "showall"
      @lists.each_value {|list| list.print}
      return true
    when "mktodo"
      if args.length < 3
        print "Please write command as: mktodo <list_label> <item_title> <item_deadline> <optional_item_description>"
        return true
      end

      list, *item_props = args;

      if @lists.has_key?(list)
        @lists[list].add_item(*item_props)
      else
        print "There is no such list, please try again"
      end
      
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
      if args.length < 2
        print "Please write command as: toggle <list_label> <item_index>"
        return true
      end

      if @lists.has_key?(args[0])
        arg_to_i = args[1].to_i - 1
        @lists[args[0]].toggle_item(arg_to_i)
      else
        print "There is no such list, please try again"
      end

      return true
    when "rm"
      if args.length < 2
        print "Please write command as: rm <list_label> <item_index>"
        return true
      end

      if @lists.has_key?(args[0])
        arg_to_i = args[1].to_i - 1
        @lists[args[0]].remove_item(arg_to_i)
      else
        print "There is no such list, please try again"
      end

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