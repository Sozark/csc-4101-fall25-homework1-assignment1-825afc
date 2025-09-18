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

def freq(str)
  return "" if str.empty?
  counts = Hash.new(0)
  str.each_char { |ch| counts[ch] += 1 }
  counts.max_by { |_, v| v }[0]
end

def isPalindrome(n)
  s = n.to_s
  s == s.reverse
end

def nthmax(n, a)
  return nil if a.empty? || n < 0 || n >= a.length
  a.uniq.sort.reverse[n]
end

def zipHash(arr1, arr2)
  return nil unless arr1.length == arr2.length
  arr1.zip(arr2).to_h
end

def hashToArray(hash)
  arr = []
  hash.each do |k, v|
    arr << [k, v]   # turn each key/value into a 2-element array
  end
  arr
end

