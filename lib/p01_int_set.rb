class MaxIntSet

  attr_reader :store
  def initialize(max)

    @store = Array.new(max, false)
    
  end

  def insert(num)

    if num > @store.length || num < 0
      raise 'Out of bounds'
    else
      @store[num] = true
    end

  end

  def remove(num)

    @store[num] = false

  end

  def include?(num)

    @store[num]

  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)

    @store[num % @store.length] << num

  end

  def remove(num)

    @store[num % @store.length].delete(num)

  end

  def include?(num)

    @store[num % @store.length].include?(num)

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    resize! if num_buckets == count
    unless self.include?(num)
      @count += 1
      @store[num % num_buckets] << num
    end

  end

  def count
    @count
  end

  def remove(num)

    if self.include?(num)
      @store[num % num_buckets].delete(num)
      @count -=1
    end

  end

  def include?(num)

    @store[num % @store.length].include?(num)

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    
    new_arr = Array.new(num_buckets*2) {Array.new}

    @store.each {|el| 
        
          
      el.each {|num| 
      new_arr[num % new_arr.length] << num if !num.nil? }
        
    }
        
    @store = new_arr
      
  end
end
