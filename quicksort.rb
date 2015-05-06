def quicksort(ary)
  n = ary.length
  if n <=1
    return ary
  end
  pivot = ary[n/2]
  less =[]
  pivots = []
  more = []
  ary.each do |num|
    if num < pivot
      less << num
    elsif num == pivot
      pivots << num
    elsif num > pivot
      more << num
    end
  end
  return quicksort(less) + pivots + quicksort(more)
end




a = [4,3,6,5,8,1,2,3,4,3,3,3,3,11]

p quicksort(a)