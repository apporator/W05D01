require "byebug"

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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end

end

class LinkedList

  include Enumerable

  attr_accessor :head, :tail
  def initialize()
    @head = Node.new()
    @tail = Node.new()
    # debugger

    @head.next = @tail
    @tail.prev = @head
    # debugger
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
  end

  def last
  end

  def empty?
    # debugger
    head.next == tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    # cur_node = head
    # # debugger
    # until cur_node.next == tail || cur_node.key == key
    #   cur_node = cur_node.next
    # end

    # if cur_node.key == key #if cur_node.key is the given key then just set it
    #   cur_node[key] = value 
    # else #this means that the next node is the tail
    #   new_node = Node.new(key, val)
    #   cur_node.next = new_node
    #   tail.prev = new_node
    # end
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end