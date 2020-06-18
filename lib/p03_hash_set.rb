class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @store.length == @count
      resize!
    end
    
    stored_value = key.hash % num_buckets
    @store.each_with_index do |array,i|
      if !array.include?(key) &&  i == stored_value
        array << key
        @count += 1
      end
    end
  end

  def include?(key)
    @store.any?{|array| array.include?(key)}

  end

  def remove(key)
    @store.each do |array|
      if array.include?(key)
        array.delete(key)
        @count-=1
      end
    end
  end

  private

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
