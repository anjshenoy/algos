class Sorter
  def self.sort(array=[])
    (1...array.size).each do |i|
      key = array[i]
      j=i-1
      while(j>=0 && array[j] > key)
        array[j+1] = array[j]
        j -= 1
      end
      array[j+1] = key
    end
    puts array.inspect
  end
end

Sorter.sort([5, 2, 6, 1, 3])
