require "byebug"

class HashSet
  attr_reader :count
  attr_reader :store

  def initialize(num_buckets = 8)
    
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    # debugger
  end

  def insert(key)
    self[key] << key

    if num_buckets == count
      self.resize!
    end
  end

  def include?(key)
    return self[key].include?(key)
  end

  def remove(key)
    return if !self.include?(key)
    self[key].delete(key)
  end

  def count
    return store.flatten.count
  end

  private

  attr_writer :store

  def num_buckets
    @store.length
  end

  def resize!
    expand = num_buckets
    all_items = store.flatten

    store.map! {Array.new}

    expand.times {store << []}

    all_items.each do |item|
      self.insert(item)
    end
  end

  def [](num)
    ix = (num.hash) % num_buckets
    return store[ix]
  end
end

# class LinkedList

#   attr_reader :key, :value

#   def initialize(key = nil, value = nil, prev = nil, after = nil)
#     @key = key
#     @value = value
#     @prev = prev
#     @after = after
#   end

#   def add(key, value)
#     until 
#   end

#   protected
#   attr_accessor :prev, :after
#   attr_writer :key, :value
# end