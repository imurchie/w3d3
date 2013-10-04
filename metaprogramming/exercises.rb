x = class A
  def initialize
    @a = 11
    @@a = 22
    a = 33
  end





  @a = 1
  @@a = 2
  a = 3
end



puts A.instance_variable_get("@a") # => 1
puts A.class_eval("@@a") # => 2
puts x

obj = A.new

puts obj.instance_variable_get("@a") # => 11
puts A.class_variable_get("@@a") # => 22

puts obj.send("initialize")