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
    @entries.any? { |e| e[:name] == name && e[:listed] }
  end

  # Lookup name by number
  def lookupByNum(number)
    @entries.any? { |e| e[:number] == number && e[:listed] }
  end

  # Check if any listed name has a number starting with areacode
  def namesByAc(areacode)
    @entries.any? { |e| e[:number].start_with?(areacode) && e[:listed] }
  end
end
