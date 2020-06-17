class MaxIntSet

  attr_reader :store, :max

  def initialize(max)
    @max = max
    @store = Array.new(max,false)
  end

  def insert(num)
    if num >= 0 && num < @max
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    stored_value = num % num_buckets
    @store.each_with_index do |array,i|
      if i == stored_value-1
        array << num
      end
    end
  end

  def remove(num)
    @store.each do |array|
      if array.include?(num)
        array.delete(num)
      end
    end
  end

  def include?(num)
    @store.any?{|array| array.include?(num)}
  end

  private

  def [](num)
    @store.each do |bucket|
      if bucket.include?(num)
        return bucket
      end
    end
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
    if @store.length == @count
      resize!
    end
    
    stored_value = num % num_buckets
    @store.each_with_index do |array,i|
      if !array.include?(num) &&  i == stored_value
        array << num
        @count += 1
      end
    end
  end
  
  def remove(num)
    @store.each do |array|
      if array.include?(num)
        array.delete(num)
        @count-=1
      end
    end
  end

  def include?(num)
    @store.any?{|array| array.include?(num)}
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    @store = Array.new(num_buckets*2) {Array.new}
    @count = 0
    old_store.flatten.each do |ele|
      insert(ele)
    end
  end
end
