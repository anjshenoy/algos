class MergeSorter

  #also counts number of inversions
  # an inversion is defined as followed
  # A pair of elements at index positions i,j 
  # such that i<j and A[i] > A[j]
  # The brute force way of getting such inversions
  # would be to have 2 for loops the outer one with
  # i=0..n and the inner one with j=i+i..n
  # but that would yield a time complexity of n^2.
  # Instead we can piggyback off of merge sort and 
  # count the number of inversions when doing the
  # merge step, specifically when comparing the 
  # elements from the subarrays. When the element
  # in the second subarray is less than the element 
  # in the first, we have an inversion. Actually,
  # in such a scenario, we have as many inversions
  # as there are elements remaining in the first
  # array.

  attr_accessor :input, :inversions
  def initialize(filename=nil)
    self.inversions = 0
    self.input = []
    if filename
      File.open(filename) do |f|
        f.each_line{|line| input << line.chomp.to_i}
      end
    end
  end

  def divide(array)
    return array if array.size == 1
    m = ((array.size-1)/2).floor
    output = merge(divide(array[0..m]), divide(array[m+1...array.size]))
    return output
  end


  private
  def merge(arr1, arr2)
    i,j = 0, 0
    output = []
    while(i < arr1.size && j < arr2.size) do
      if arr1[i] <= arr2[j]
        output << arr1[i]
        i += 1
      else
        output << arr2[j]
        self.inversions += (arr1.size - i)
        j += 1
      end
    end
    if(i >= arr1.size)
      output += arr2[j...arr2.size]
    end
    if(j >= arr2.size)
      output += arr1[i...arr1.size]
    end
    return output
  end
end


#a= [5,15, 2, 9, 8, 7]
#a=[1,2,3,4,5,6,7,8,9,10]
m = MergeSorter.new("IntegerArray.txt")
#puts m.input.inspect
m.divide(m.input)
#puts "sorted array = #{m.divide(m.input)}"
puts "*"*100
puts "inversions = #{m.inversions}"
