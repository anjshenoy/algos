class MergeSorter

  def self.divide(array)
    puts "input = #{array.inspect}"
    return array if array.size == 1
    m = ((array.size-1)/2).floor
    output = merge(divide(array[0..m]), divide(array[m+1...array.size]))
    puts "merge result = #{output.inspect}"
    return output
  end


  private
  def self.merge(arr1, arr2)
    puts "calling merge with #{arr1.inspect} #{arr2.inspect}"
    i,j = 0, 0
    output = []
    while(i < arr1.size && j < arr2.size) do
      if arr1[i] <= arr2[j]
        output << arr1[i]
        i += 1
      else
        output << arr2[j]
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


a= [5,15, 2, 9, 8, 7]
puts MergeSorter.divide(a)
