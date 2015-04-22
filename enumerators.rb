module Enumerable
  # Quick and dirty functions. Learning how yielding and calling procs works
  
  
  def my_each
    return self unless block_given?
    for i in self
      yield self[i]
    end
  end
  
  def my_each_with_index
    return self unless block_given?
    n = self.length-1
    for i in 0..n
      yield self[i], i
    end
  end
  
  def my_select
    return self unless block_given?
    selected = []
    self.my_each do |i|
      selected << i if yield(i)==true
    end
    return selected
  end
  
  def my_all?
    
    for i in self
      if yield(i) == false
       return false
      end
    end
  return true
  end
  
  def my_any?
    for i in self
      if yield(i) == true
        return true
      end
    end
    return false
  end
  
  def my_none?
    for i in self
      if yield(i) == false
        return true
      end
    end
    return true
  end
  
  def my_count
    counter = 0
    if block_given?
      for i in self
        counter += 1 if yield(i)
      end
    else
      for i in self
        counter += 1
      end
    end
    return counter
  end
  
  def my_map(proc = nil)
    result = []
    if proc != nil && proc.is_a?(Proc)
      for i in self
        result << proc.call(i)
      end
    end
    return result
    
  end
  
  def my_inject(result=self.first)
    
    for i in self
      result = yield(result,i)
    end
    return result
  end
  
end

  
#a = [1,2,3,4]

#a.my_each_with_index {|x,i| puts "index #{i} gives value #{x}"}
#p a.my_select {|x| x.to_i > 2}

#b = [1,3,5,7]
#p b.my_all? {|x| x.to_i > 0}


#p a.my_count {|x| x > 2}
#p b.inject {|sum,x|sum+x}
#c = Proc.new {|x| x*2}
#p b.my_map(c)      