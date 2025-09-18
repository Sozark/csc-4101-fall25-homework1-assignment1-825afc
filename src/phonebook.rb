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
  puts pb.add("John", "110-192-1862", false)  # true
  puts pb.add("Jane", "220-134-1312", true)   # true
  puts pb.add("John", "110-192-1862", false)  # false (duplicate name)
  puts pb.add("Ravi", "110", true)             # false (invalid number)
  puts pb.add("Eve", "220-134-1312", true)    # false (number already listed)
  puts pb.add("Rob", "220-134-1312", false)   # true (unlisted allowed multiple times)
  puts pb.lookup("John")    # nil (unlisted)
  puts pb.lookup("Jane")    # "220-134-1312"
  puts pb.lookupByNum("220-134-1312")  # "Jane"
  puts pb.lookupByNum("110-192-1862")  # nil (unlisted)
  puts pb.namesByAc("110").inspect  # ["John"]
  puts pb.namesByAc("220").inspect  # ["Jane", "Rob"]

    
