class A
  @@a = 1
  @a = 2
  a = 3

  # Write your code here. Use binding method.
  def get_binding
    binding
  end

  def self.get_class_binding(a = 3)
    binding
  end
end

obj = A.new
binding = obj.get_binding
puts binding

p eval('[@@a, @a, a]', A.get_class_binding)   # Replace '*****' to your code
