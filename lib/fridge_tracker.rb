require_relative '../config/environment'
require_relative '../app/models/fridge'

puts "Enter an option:"
puts "A) List all Fridges"
puts "B) Add a Fridge"
puts "C) Delete a Fridge"
puts "D) View all food inside a fridge"
puts "E) Add a food to a fridge"
# puts "F) Eat a food item"
puts "G) View drink items from a fridge"
# puts "H) Add a drink to fridge"
# puts "I) Have a little drink"
# puts "J) Take a drink from fridge"
option = gets.chomp
puts "You selected #{option}"

if option.upcase == 'A'
    puts Fridge.all.to_s
    Fridge.all.map do |fridge|
      puts "Fridge ID = " + fridge.id.to_s
      puts fridge.location.to_s
      puts fridge.brand.to_s
      puts fridge.size.to_s
    end
  end

if option.upcase == 'B'
    puts "Fridge location"
    Fridge_location = gets.chomp 
    puts "What is the brand"
    Fridge_brand = gets.chomp   
    puts "What size in cubic feet is the fridge"
    Fridge_size = gets.chomp 
    Fridge.create do |fridge|
      fridge.location = Fridge_location
      fridge.brand = Fridge_brand
      fridge.size = Fridge_size
      fridge.has_food = false
      fridge.has_drink = false 
    end 
  end

if option.upcase == 'C'
  puts 'Which fridge do you want to delete? [location]'
  Fridge.all.map do |i|
    puts i.location.to_s
  end
  input = gets.chomp
  Fridge.find_by(location: input).destroy
end

if option.upcase == 'D'
    Fridge.all.map{|fridge| puts fridge.location}
    puts "Which fridge would you like to see?"
    fridge_location = gets.chomp.upcase
    fridge_food = Fridge.find_by(location:fridge_location).foods
    puts "That fridge contains #{fridge_food}"
  end

if option.upcase == 'E'
  Fridge.all.map{|fridge| puts fridge.location}
  puts "Which fridge to you want to put your food in?"
  brand = gets.chomp
  puts "Food name:"
  name = gets.chomp
  puts "Food weight in pouds:"
  weight = gets.chomp
  puts "Is this vegan?"
  vegan = gets.chomp
    case vegan
      when 'y', 'Y', 'yes'
        vegan = true
      when 'n', 'N', 'no'
        vegan = false
    end
  Fridge.find_by(location: location).foods.push(Food.create(name: "#{name}", weight: "#{weight} lbs", vegan: vegan))
end



if option.upcase == 'G'
    puts "View all drinks"
    Drink.all.map do |drink|
        puts drink.name.to_s
    end
end