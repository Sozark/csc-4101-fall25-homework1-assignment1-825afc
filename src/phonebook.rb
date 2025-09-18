# Fibonacci sequence: return an array of the first n Fibonacci numbers
def fib(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0, 1] if n == 2

  seq = [0, 1]
  (n - 2).times do
    seq << seq[-1] + seq[-2]
  end
  seq
end

# Frequency: return the most frequent character in a string
def freq(str)
  return "" if str.empty?
  counts = Hash.new(0)
  str.each_char { |ch| counts[ch] += 1 }
  counts.max_by { |_, v| v }[0]
end

# Palindrome check
def isPalindrome(str)
  str == str.reverse
end

# nth maximum in an array
def nthMax(arr, n)
  return nil if arr.empty? || n <= 0 || n > arr.length
  arr.uniq.sort.reverse[n - 1]
end

# Convert two arrays into a hash, return nil if sizes don’t match
def zipHash(keys, values)
  return nil unless keys.length == values.length
  keys.zip(values).to_h
end

