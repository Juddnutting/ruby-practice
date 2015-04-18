def bubble_sort(array)

  
  swapped = true
  while swapped
    swapped = false
      for i in 0..array.length-2
       if array[i] > array[i+1]
          array[i+1], array[i] = array[i], array[i+1]
          swapped = true
       end 
     end
  end
  array
end

p bubble_sort([3,2,7,4,1])
