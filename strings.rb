class String
  def reverse!
    last = self.size-1
    mid = (last/2).floor
    (0..mid).each do |i|
      self[i], self[last-i] = self[last-i], self[i]
    end
    self
  end

  def palindrome?(parse_from_middle = false)
    last = self.size-1
    mid = (last/2).floor
    unless(parse_from_middle)
      (0..mid).each do |i|
        unless(self[i] == self[last-i])
          return false
        end
      end
      return true
    else
      (0..mid).each do |i|
        unless(self[mid-i] == (self.size.odd? ? self[mid+i] : self[mid+i+1]))
          return false
        end
      end
      return true
    end
  end
end

puts "abcde".reverse!
puts "abcde".palindrome?
puts "malayalam".palindrome?
puts "abcde".palindrome?(true)
puts "malayalam".palindrome?(true)
puts "xaax".palindrome?(true)
