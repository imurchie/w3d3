class I
  def initialize(n)
    @n = n
  end

  def like arg
    puts @n
    puts "%s %s %s" % [self.class, self.class.instance_methods(false), arg]
  end
end

c, m, arg = gets.split  # input 'I like metaprogramming.'

# write your code here to display 'I like metaprogramming.'


klass = self.class.const_get(c)
obj = klass.new(5)
method = obj.method(m)

method.call(arg)

obj.send(method.name, arg)
