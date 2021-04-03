require 'open-uri'

puts "Destroy ingredients"
Ingredient.destroy_all if Rails.env.development?

puts "Destroy Cocktails"
Cocktail.destroy_all if Rails.env.development?

puts "Create ingredients"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

puts "Create 1 cocktail"
  mojito = Cocktail.new(name: "Mojito", photo: URI('https://www.masculin.com/wp-content/uploads/sites/2/article/12863/variante-mojito.jpg'))
puts "Created mojito!"


# puts puts "Create cocktails"
# water = Cocktail.create(name: "Water", doses: "1L")
# mojito = Cocktail.create(name: "Mojito", doses: "3cL")
# cidre = Cocktail.create(name: "Cider", doses: "75cL")
# puts "Created cocktails"


# puts "Create cocktails"
# url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
# cocktails = JSON.parse(open(url).read)
# cocktails["drinks"].each do |cocktail|
#   i = Cocktail.create(name: cocktail["strCocktails1"])
#   puts "create #{i.name}"
# end
