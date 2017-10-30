namespace :dev do
  desc "Hydrate the database with some dummy data to make it easier to develop"
  task prime: "db:setup" do
    addresses = [
      "2461 N Lincoln Ave, Chicago, IL 60614",
      "2421 W North Ave, Chicago, IL 60647",
      "1024 N Western Ave, Chicago, IL 60622",
      "2657 N Kedzie Ave, Chicago, IL 60647",
      "431 N Dearborn St, Chicago, IL 60654",
      "820 W Randolph St, Chicago, IL 60607",
      "300 N Lasalle, Chicago, IL 60654",
      "3143 W Logan Blvd, Chicago, IL 60647",
      "1450 W Chicago Ave, Chicago, IL 60642",
      "1633 N Halsted St, Chicago, IL 60614",
      "1480 N Milwaukee Ave, Chicago, IL 60622",
      "2311 W North Ave, Chicago, IL 60647",
      "2421 N Milwaukee Ave, Chicago, IL 60647",
      "2149 S Halsted St, Chicago, IL 60608",
      "66 E Ohio Street, Chicago, IL 60611",
      "1960 N Western Ave, Chicago, IL 60647",
      "1482 N. Milwaukee Ave, Chicago, IL 60622",
      "1408 N Milwaukee Ave, Chicago, IL 60622",
      "837 W Fulton Market, Chicago, IL 60607",
      "1401 N Ashland Ave, Chicago, IL 60622",
      "964 W 31st St, Chicago, IL 60608",
      "1840 W North Ave, Chicago, IL 60622",
      "116 W Hubbard St, Chicago, IL 60654",
      "1531 N Damen, Chicago, IL 60622",
      "5751 S Woodlawn Ave, Chicago, IL 60637",
      "218 W Kinzie St, Chicago, IL 60654",
      "800 W Randolph St, Chicago, IL 60607",
    ]

    20.times do
      coffee_bean = CoffeeBean.new
      coffee_bean.blend_name = Faker::Coffee.blend_name
      coffee_bean.origin = Faker::Coffee.origin
      coffee_bean.variety = Faker::Coffee.variety
      coffee_bean.notes = Faker::Coffee.notes
      coffee_bean.save
    end

    puts "There are now #{CoffeeBean.count} coffee beans in the database."

    20.times do |i|
      food = Food.new
      food.ingredient = Faker::Food.ingredient
      food.spice = Faker::Food.spice
      food.measurement = Faker::Food.measurement
      food.store_address = addresses[i]
      food.save
    end

    puts "There are now #{Food.count} foods in the database."
  end
end
