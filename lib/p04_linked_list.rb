class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next =  self.next if  self.prev
    self.next.prev =  self.prev if  self.next
    self.next = nil
    self.prev = nil
    self
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList

  include Enumerable
  attr_reader :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |node|
      return node.val if node.key == key 
    end
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end
    return false
  end

  def append(key, val)
    insert_node = Node.new(key,val)
    prev = @tail.prev
    insert_node.prev = prev
    prev.next = insert_node
    @tail.prev = insert_node
    insert_node.next = @tail
  end

  def update(key, val)
    each do |node|
      if key == node.key
        node.val = val
      end
    end
  end

  def remove(key)
    each do |node|
      if node.key == key && !node.nil?
        node.remove
        return node.val
      end
    end
    nil
  end

  def each
    node = @head.next
    until node == @tail
      yield node
      node = node.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
