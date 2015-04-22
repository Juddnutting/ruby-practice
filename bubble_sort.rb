def bubble_sort(array)
  
  n = array.length
  sorted? = false
  until sorted? 
    sorted? = true
      for i in 0..n-2
       if array[i] > array[i+1]
          array[i+1], array[i] = array[i], array[i+1]
          sorted? = false
       end 
     end
  end
  array
end

#p bubble_sort([3,2,7,4,1])
