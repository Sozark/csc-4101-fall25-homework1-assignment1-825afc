class PhoneBook
  def initialize
    @entries = []  # stores hashes like { name:, number:, listed: }
  end

  # Add a new entry; return true if successfully added
  def add(name, number, is_listed = true)
    @entries << { name: name, number: number, listed: is_listed }
    true
  end

  # Lookup number by name
  def lookup(name)
    entry = @entries.find { |e| e[:name] == name && e[:listed] }
    entry ? entry[:number] : nil
  end

  # Lookup name by number
  def lookupByNum(number)
    entry = @entries.find { |e| e[:number] == number && e[:listed] }
    entry ? entry[:name] : nil
  end

  # Return array of names with numbers starting with areacode (listed only)
  def namesByAc(areacode)
    result = @entries.select { |e| e[:number].start_with?(areacode) && e[:listed] }
                     .map { |e| e[:name] }
    result.empty? ? nil : result
  end

  # Optional: for testing
  def show
    puts @entries.inspect
  end
end

# ----- TEST ---- #
pb = PhoneBook.new
puts pb.add("Alice", "555-1234")           # => true
puts pb.add("Bob", "555-5678", false)      # => true
puts pb.lookup("Alice")                     # => "555-1234"
puts pb.lookup("Bob")                       # => nil
puts pb.lookupByNum("555-1234")             # => "Alice"
puts pb.lookupByNum("555-5678")             # => nil
puts pb.namesByAc("555")                    # => ["Alice"]
pb.show
