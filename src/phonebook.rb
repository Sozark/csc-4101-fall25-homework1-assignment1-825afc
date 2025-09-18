class PhoneBook
  def initialize
    @entries = []  # stores hashes like { name:, number:, listed: }
  end

  # Add a new entry; returns the is_listed boolean
  def add(name, number, is_listed = true)
    entry = { name: name, number: number, listed: is_listed }
    @entries << entry
    is_listed
  end

  # Lookup number by name (only listed numbers)
  def lookup(name)
    entry = @entries.find { |e| e[:name] == name && e[:listed] }
    entry ? entry[:number] : nil
  end

  # Lookup name by number (only listed numbers)
  def lookupByNum(number)
    entry = @entries.find { |e| e[:number] == number && e[:listed] }
    entry ? entry[:name] : nil
  end

  # Return all names whose numbers start with areacode (listed or not)
  def namesByAc(areacode)
    @entries
      .select { |e| e[:number].start_with?(areacode) }  # include unlisted
      .map { |e| e[:name] }
  end

  # Show all entries (for testing)
  def show
    puts @entries.inspect
  end
end

# ----- TEST ---- #
pb = PhoneBook.new
puts pb.add("Alice", "555-1234")         # => true (listed by default)
puts pb.add("Bob", "555-5678", false)    # => false
puts pb.lookup("Alice")                  # => "555-1234"
puts pb.lookup("Bob")                    # => nil
puts pb.lookupByNum("555-1234")          # => "Alice"
puts pb.lookupByNum("555-5678")          # => nil
puts pb.namesByAc("555")                 # => ["Alice", "Bob"]
pb.show
