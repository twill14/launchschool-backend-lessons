################ Question 1 #####################

=begin
 Blocks in ruby have access to local variables. This means that even when a variable is declared 
 outside of the block, if the method is specifically altered or changed inside the block, it will
 change both the variable's value and it's object I.D permanently. 

 Even after the block has finished executing.
=end

################ Question 2 #####################

=begin
In a method, we have to consider immutable and mutable objects. Immutable objects cannot be changed, meaning:
when we wish to alter the value of an immutable object, we may only do so by reassigning the object to a new value.
  The previous value becomes unaccessible. 

Mutable objects leave room for altering them. However, doing so is based strictly on whether or not we subject
them to a method which has destructive properties. 

Unlike blocks. Methods have their own personal scope. This means that any changes we apply in a method (especially
when assinging varibales outside the method and attempting to alter their values using arguements) we will find
  that the original value of the variable will retain its original form.

  This is because, the value was indeed changed, but the pointer to that changed value was only captured within
  the local scope of the method and so, it is only accessible from the method itself.

  This is why when we create a method, we must return a value, by returning a value, we provide acess to the newly 
  created value from the methods previosly  private inner scope.
=end

############### Question 3 #####################

=begin
 In this example, we have a string and an array that are passed into a method.
 In this methods we hope to add a new string by concatanation to the string and by loading
 a new element in the array. 

 Fortunately array's and strings are both mutable objects. So we would assume that by altering them both in 
 the method. We could have a permanent change that affects even the outer scope.

The first thing to note here is, we have a string. And we wish to concatenate the string using "+=".

The problem with this is: += is essentially an assignment opperator. Assignment operators are NOT mutatable
methods. So if we try to alter the value of this string. Within the scope of this methods, yes, it has been
temporarily altered. 

However, since it is only within the local scope of the method, the outer method has no access to that change
in the string.

On the other had, the array uses the << notation. This notation is indeed a mutatable method. And on top of that,
methods always default to returning the last line. 

So when we call our method and use our variables to plug in as parameters.

We will result in seeing the second puts displaying the changed value of the array. 

But the first will not update the change in value for my_string. 
  
=end

############### Question 4 #####################
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins','rutabaga']
end

my_string = "pumpkins"
my_array = ['pumpkins']

my_array = tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin
We reassigned the array, but that assignment is non mutatable. 
  
=end

############### Question 5 #####################
def color_valid(color)
  color == "blue" || color == "green"
end
