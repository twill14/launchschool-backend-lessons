######## Question 1 #######
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# Or

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

######## Question 2 #######
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push("Dino")

p flintstones

######## Question 3 #######
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones += ["Dino", "Hoppy"]

######## Question 4 #######
advice = "Few things in life are as important as house training your pet dinosaur."

half_advice = advice.slice!(0..38) # Mutative

p advice

p half_advice

######## Question 5 #######
statement = "The Flintstones Rock!"

statement.scan('t').count

######## Question 6 #######
title = "Flintstone Family Members"

title.center(40)
