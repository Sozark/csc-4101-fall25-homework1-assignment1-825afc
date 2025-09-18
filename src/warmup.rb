def fib(n)
    if n < 2
      return n 
    else
      return fib(n - 1) + fib(n - 2)
    end
  end
  # --- Tests ---
  (0...10).each do |i|
    puts "fib(#{i}) = #{fib(i)}"

  end
  
def isPalindrome?(n)                            # This method is to figure out if a statement is a Palindrome or not 
    n == n.reverse                              # This is a method that's attached to n and will see if any values are reversed
end

puts isPalindrome?("racecar")
puts isPalindrome?("hello")

def nthmax(n, a)                                # a is the array you're iterating and n is the integer. 
    sorted = a.sort.reverse            
    return sorted[n - 1]
end

def freq(s)                                     # This method is for counting how many times a character appears
    counts = Hash.new(0)                        # Creates a hash with a value of 0
    s.each_char { |c| counts[c] += 1 }          # Increments a count for each character that appears 
    return counts                               # returns the hash
end
# -- TESTS --
puts freq("Hello")

def zipHash(arr1, arr2)                          # you're combining two arrays of the same length to create one singular hash
    hash = {}
    arr1.each_with_index do |key, i|             # Loop over each element of arr1 along with its index
        value = arr2[i]                          # Find the corresponding value in arr2 at the same index
        hash[key] = value                        # Assign the key-value pair to the hash
    end 
    hash                                         # Returns the completed hash
end
# -- TEST -- 
keys = ["a", "b", "c"]
values = [1, 2, 3]
puts zipHash(keys, values)                       # Converts a hash into an array of [key,value] pairs

def hashToArray(hash)                            # 
    hash.to_a                                    # Ruby’s built-in method for converting hashes to arrays
end
# -- TEST -- 
my_hash = {"a" => 1, "b" => 2, "c" => 3}
puts hashToArray(my_hash).inspect
