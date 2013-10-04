MaskedString = Class.new(String) do
  define_method(:tr_vowel) { tr 'aeiou', '*' }

  self.class.send(:define_method, :tr_vowel) do |str|
    str.tr 'aeiou', '*'
  end
end

p MaskedString.tr_vowel("this is also a test")

# instance method
obj = MaskedString.new("this is a test")
p obj.tr_vowel
