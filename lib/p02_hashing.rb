class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    num = 0
    self.each do |ele|
      num += ele.to_i + ele % 4
      num *= ele/2
    end
    num
  end
end

class String
  ALPHA_NUMBERS = {
  'a' => 1,
  'b' => 2,
  'c' => 3,
  'd' => 4,
  'e' => 5,
  'f' => 6,
  'g' => 7,
  'h' => 8,
  'i' => 9,
  'j' => 10,
  'k' => 11,
  'l' => 12,
  'm' => 13,
  'n' => 14,
  'o' => 15,
  'p' => 16,
  'q' => 17,
  'r' => 18,
  's' => 19,
  't' => 20,
  'u' => 21,
  'v' => 22,
  'w' => 23,
  'x' => 24,
  'y' => 25,
  'z' => 26
  }

  def hash
    num = 0
    self.each_char.with_index do |ele,i|
      num += ALPHA_NUMBERS[ele.downcase] * i 
    end
    num
  end
end

class Hash
    ALPHA_NUMBERS = {
  'a' => 1,
  'b' => 2,
  'c' => 3,
  'd' => 4,
  'e' => 5,
  'f' => 6,
  'g' => 7,
  'h' => 8,
  'i' => 9,
  'j' => 10,
  'k' => 11,
  'l' => 12,
  'm' => 13,
  'n' => 14,
  'o' => 15,
  'p' => 16,
  'q' => 17,
  'r' => 18,
  's' => 19,
  't' => 20,
  'u' => 21,
  'v' => 22,
  'w' => 23,
  'x' => 24,
  'y' => 25,
  'z' => 26
  }
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    num = 0
    self.each do |k,v|
      if k.is_a?(Integer) && v.is_a?(Integer)
        num += k * 26 + v
      elsif k.is_a?(Integer) && !v.is_a?(Integer)
        num += k * 26 + ALPHA_NUMBERS[v.to_s.downcase]
      elsif v.is_a?(Integer) && !k.is_a?(Integer)
        num += v * 26 + ALPHA_NUMBERS[k.to_s.downcase]
      elsif !k.nil? && !v.nil?
        num += ALPHA_NUMBERS[k.to_s.downcase] * ALPHA_NUMBERS[v.to_s.downcase]
      end
    end
    num
  end
end
