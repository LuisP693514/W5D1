class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    resize! if num_buckets == count
    unless self.include?(num)
      @count += 1
      @store[num.hash % num_buckets] << num
    end

  end

  def count
    @count
  end

  def remove(num)

    if self.include?(num)
      @store[num.hash % num_buckets].delete(num)
      @count -=1
    end

  end

  def include?(num)

    @store[num.hash % @store.length].include?(num)

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
      new_arr[num.hash % new_arr.length] << num if !num.nil? }
        
    }
        
    @store = new_arr
      
  end
end   