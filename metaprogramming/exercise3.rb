animal = 'dog'

# define singleton speak() method


# 1.
# def animal.speak
#   puts "Dog says Woof!"
# end

# 2.
# class << animal
#   def speak
#     puts "Dog says Woof!"
#   end
# end

# 3.
# (class << animal; self; end).send(:define_method, :speak) { puts "Dog says Woof!" }

# 4.
# animal.instance_eval do
#   def speak
#     puts "Dog says Woof!"
#   end
# end

# module Speak
#   def speak
#     puts "Dog says Woof!"
#   end
# end
# 5.
# animal.extend(Speak)
# 6.
# (class << animal; self; end).class_eval { include Speak }

# 7.
animal.send(:define_singleton_method, :speak, lambda { puts "Dog says Woof!" })


animal.speak  #=> 'Dog says Woof!'
