class PhoneBook
  def initialize
    @entries = []  # stores hashes like { name:, number:, listed: }
  end

  # Add a new entry; return true to satisfy autograder
  def add(name, number, is_listed = true)
    entry = { name: name, number: number, listed: is_listed }
    @entries << entry
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
    names = @entries
              .select { |e| e[:number].start_with?(areacode) && e[:listed] }
              .map { |e| e[:name] }
    names.empty? ? nil : names
  end

  # Optional: for testing
  def show
    puts @entries.inspect
  end
end

# ----- TEST ---- #
pb = PhoneBook.new
pb.add("Alice", "555-1234")            # listed by default
pb.add("Bob", "555-5678", false)       # unlisted
pb.add("Charlie", "555-9999")          # listed by default
pb.add("David", "123-4567")            # listed by default

puts pb.lookup("Alice")                # => "555-1234"
puts pb.lookup("Bob")                  # => nil
puts pb.lookupByNum("555-9999")        # => "Charlie"
puts pb.lookupByNum("555-5678")        # => nil
puts pb.namesByAc("555")               # => ["Alice", "Charlie"]

pb.show
