require "byebug"

class MaxIntSet
  def initialize(max)
    @ceiling = max
    @store = Array.new(max, false)
    # debugger
  end

  def insert(num)
    raise "Out of bounds" if !num.between?(0,ceiling - 1)
    store[num] = true
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num] == true
  end

  attr_accessor :store, :ceiling

  private

  def is_valid?(num)
  end

  def validate!(num)
  end

  
end

# Initialize an array of size 20 with an empty array stored at each index.
# To add a number to the set, modulo (%) the number by the set's length and add it to the array at that index. If the integer is present in that bucket, then it's included in the set.
# You should implement the #[] method to easily look up a bucket in the store; calling self[num] will be more DRY than @store[num % num_buckets] at every step of the way!
# Your new set should be able to keep track of an arbitrary range of integers, including negative integers. Test it out.

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    # @num_buckets = num_buckets
  end

  def insert(num)
    bix = bucket_ix(num)
    store[bix] << num
  end

  def remove(num)
    bix = bucket_ix(num)
    store[bix].delete(num)
  end

  def include?(num)
    bix = bucket_ix(num)
    return store[bix].include?(num)
  end

  attr_reader :store

  def num_buckets
    store.length
  end

  private

  # def [](num)
  #   return num % num_buckets
  #   # optional but useful; return the bucket corresponding to `num`
  # end

  def bucket_ix(num)
    num % num_buckets
  end

  attr_writer :store, :num_buckets
end

class ResizingIntSet < IntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    super
  end

  def insert(num)
    bix = bucket_ix(num)
    # debugger
    return if self.include?(num)
    store[bix] << num unless include?(num)
    if self.count == num_buckets
      self.resize!
    end

    
    # if !include?(num)
    #   if 
    #   store[bix] << num
    # end
    # debugger
  end

  def count
    return store.count {|b| !b.empty?}
  end

  # def remove(num)
  # end

  # def include?(num)
  # end

  private

  # def num_buckets
  #   @store.length
  # end

  def resize!
    # debugger
    c = count
    if num_buckets == c
      # debugger
      c.times {store << []}

      all_items = store.flatten

      store.map! { Array.new() }
      
      all_items.each do |item|
        # debugger
        self.insert(item)
      end
      # debugger
      # debugger
    end
    # debugger
  end

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  # end
end