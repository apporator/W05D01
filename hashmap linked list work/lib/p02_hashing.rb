require "byebug"

class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_num = 0
    self.each do |ele|
      hash_num = hash_num + ele.hash
      hash_num = hash_num.hash
    end
    # debugger
    return hash_num
  end

end

class String
  def hash
    
    return self.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end

