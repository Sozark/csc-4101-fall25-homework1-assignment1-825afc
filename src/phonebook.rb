class PhoneBook
    def initialize
      @entries = []                                                       # Instance variable to store entries
    end
  
                                                                          # Add a new entry; is_listed defaults to true if not provided
    def add(name, number, is_listed = true)
      entry = { name: name, number: number, listed: is_listed }
      @entries << entry
  
      if is_listed
        puts "#{name}'s number is listed."
      else
        puts "#{name}'s number is not listed."
      end
    end
  
                                                                          # Lookup number by name if listed
    def lookup(name)
      entry = @entries.find { |e| e[:name] == name && e[:listed] }
      if entry
        entry[:number]
      else
                                                                          # Return nil or a message; avoid using undefined variable 'number'
        puts "#{name}'s number is not listed."
        nil
      end
    end
  
                                                                          # Lookup name by number if listed
    def lookupByNum(number)
      entry = @entries.find { |e| e[:number] == number && e[:listed] }
      if entry
        entry[:name]
      else
        puts "#{number}'s number is not listed."
        nil
      end
    end
  
                                                                          # Return array of names with numbers starting with areacode and listed
    def namesByAc(areacode)
      names = @entries.select { |e| e[:number].start_with?(areacode) && e[:listed] }
                      .map { |e| e[:name] }                               # Close the block properly
      names
    end
  
                                                                          # Show all entries (for testing)
    def show
      puts @entries.inspect
    end
  end
  
  # ----- TEST ---- #
  pb = PhoneBook.new
  pb.add("Alice", "555-1234")                                              # is_listed defaults to true
  pb.add("Bob", "555-5678", false)
  pb.add("Charlie", "555-9999")
  pb.add("David", "123-4567")
  
  puts pb.lookup("Alice")         # => "555-1234"
  puts pb.lookup("Bob")           # => nil (not listed)
  puts pb.lookupByNum("555-9999") # => "Charlie"
  puts pb.lookupByNum("555-5678") # => nil (not listed)
  puts pb.namesByAc("555")        # => ["Alice", "Charlie"]
  
  pb.show
  

    
