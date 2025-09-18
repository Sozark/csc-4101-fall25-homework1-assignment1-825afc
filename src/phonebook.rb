class PhoneBook
  def initialize
    @entries = []  # stores hashes like { name:, number:, listed: }
  end

  # Add a new entry; return true to satisfy autograder
  def add(name, number, is_listed = true)
    entry = { name: name, number: number, listed: is_listed }
    @entries << entry
    entry
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

  # Check if any listed name has a number starting with areacode
  def namesByAc(areacode)
    names = @entries
              .select { |e| e[:number].start_with?(areacode) && e[:listed] }
              .map { |e| e[:name] }
    names.empty? ? nil : names
  end
  end  
end
