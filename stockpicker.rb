def stockpicker(prices)
  index = []
  max_profit = 0
  for i in 0...prices.length-1
    for j in i...prices.length
      if prices[j] - prices[i] > max_profit
        max_profit = prices[j]-prices[i]
        index = [i,j]
      end
    end 
  end
  index
end

#puts stockpicker([100,50,80,4,70])
