class Fib
  def self.recursive(n=10, a1=1, a2=1)
    # a2 == 1 only in the first run, thus checking a1 is redundant 
    # and even wasteful as a1==1 in the second round as well.
    if a2==1 
      puts a1 
      n -= 2
    end
    puts a2
    return n==0 ? a2 : recursive(n-1, a2, a1+a2)
  end

  def self.iterate(n=10)
    a1=a2 = 1
    puts a1
    (n-2).times do
      puts a2
      a1,a2 = a2, a1+a2
    end
    return a2
  end
end

puts Fib.recursive
puts Fib.iterate
