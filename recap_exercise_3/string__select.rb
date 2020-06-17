class String
  def select(&proc)
    proc ||= Proc.new { || false }
    new_string = ""

    self.each_char do |char|
      new_string += char if proc.call(char)
    end

    new_string
  end
end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""
