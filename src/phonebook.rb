class PhoneBook
  def initialize
    @entries = []  # stores hashes like { name:, number:, listed: }
  end

  # Add a new entry; return true if successfully added
  def add(name, number, is_listed = true)
    @entries << { name: name, number: number, listed: is_listed }
    true
  end

  # Lookup number by name (return true if found and listed)
  def lookup(name)
    found = @entries.any? { |e| e[:name] == name && e[:listed] }
    found
  end

  # Lookup name by number (return true if found and listed)
  def lookupByNum(number)
    found = @entries.any? { |e| e[:number] == number && e[:listed] }
    found
  end

  # Check if any listed name has a number starting with areacode (return true if found)
  def namesByAc(areacode)
    found = @entries.any? { |e| e[:number].start_with?(areacode) && e[:listed] }
    found
  end

  # Optional: for testing
  def show
    puts @entries.inspect
  end
end

# ----- TEST ---- #
pb = PhoneBook.new
puts pb.add("Alice", "555-1234")         # => true
puts pb.add("Bob", "555-5678", false)    # => true
puts pb.lookup("Alice")                  # => true
puts pb.lookup("Bob")                    # => false
puts pb.lookupByNum("555-1234")          # => true
puts pb.lookupByNum("555-5678")          # => false
puts pb.namesByAc("555")                 # => true
pb.show
