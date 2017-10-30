require "rails_helper"

feature "FOODS" do
  context "index" do
    it "has the ingredient of every row", points: 1 do
      test_foods = create_list(:food, 5)

      visit "/foods"

      test_foods.each do |current_food|
        expect(page).to have_content(current_food.ingredient)
      end
    end
  end

  context "index" do
    it "has the spice of every row", points: 1 do
      test_foods = create_list(:food, 5)

      visit "/foods"

      test_foods.each do |current_food|
        expect(page).to have_content(current_food.spice)
      end
    end
  end

  context "index" do
    it "has the measurement of every row", points: 1 do
      test_foods = create_list(:food, 5)

      visit "/foods"

      test_foods.each do |current_food|
        expect(page).to have_content(current_food.measurement)
      end
    end
  end

  context "index" do
    it "has a link to the details page of every row", points: 0 do
      test_foods = create_list(:food, 5)

      visit "/foods"

      test_foods.each do |current_food|
        expect(page).to have_css("a[href*='#{current_food.id}']", text: "Show details")
      end
    end
  end

  context "details page" do
    it "has the correct ingredient", points: 0 do
      food_to_show = create(:food)

      visit "/foods"
      find("a[href*='#{food_to_show.id}']", text: "Show details").click

      expect(page).to have_content(food_to_show.ingredient)
    end
  end

  context "details page" do
    it "has the correct spice", points: 0 do
      food_to_show = create(:food)

      visit "/foods"
      find("a[href*='#{food_to_show.id}']", text: "Show details").click

      expect(page).to have_content(food_to_show.spice)
    end
  end

  context "details page" do
    it "has the correct measurement", points: 0 do
      food_to_show = create(:food)

      visit "/foods"
      find("a[href*='#{food_to_show.id}']", text: "Show details").click

      expect(page).to have_content(food_to_show.measurement)
    end
  end

  context "index" do
    it "has a link to the new food page", points: 0 do
      visit "/foods"

      expect(page).to have_css("a", text: "Add a new food")
    end
  end

  context "new form" do
    it "saves the ingredient when submitted", points: 2, hint: h("label_for_input") do
      visit "/foods"
      click_on "Add a new food"

      test_ingredient = "A fake ingredient I'm typing at #{Time.now}"
      fill_in "Ingredient", with: test_ingredient
      click_on "Create food"

      last_food = Food.order(created_at: :asc).last
      expect(last_food.ingredient).to eq(test_ingredient)
    end
  end

  context "new form" do
    it "saves the spice when submitted", points: 2, hint: h("label_for_input") do
      visit "/foods"
      click_on "Add a new food"

      test_spice = "A fake spice I'm typing at #{Time.now}"
      fill_in "Spice", with: test_spice
      click_on "Create food"

      last_food = Food.order(created_at: :asc).last
      expect(last_food.spice).to eq(test_spice)
    end
  end

  context "new form" do
    it "saves the measurement when submitted", points: 2, hint: h("label_for_input") do
      visit "/foods"
      click_on "Add a new food"

      test_measurement = "A fake measurement I'm typing at #{Time.now}"
      fill_in "Measurement", with: test_measurement
      click_on "Create food"

      last_food = Food.order(created_at: :asc).last
      expect(last_food.measurement).to eq(test_measurement)
    end
  end

  context "new form" do
    it "redirects to the index when submitted", points: 0, hint: h("redirect_vs_render") do
      visit "/foods"
      click_on "Add a new food"

      click_on "Create food"

      expect(page).to have_current_path("/foods")
    end
  end

  context "details page" do
    it "has a 'Delete food' link", points: 0 do
      food_to_delete = create(:food)

      visit "/foods"
      find("a[href*='#{food_to_delete.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Delete")
    end
  end

  context "delete link" do
    it "removes a row from the table", points: 4 do
      food_to_delete = create(:food)

      visit "/foods"
      find("a[href*='#{food_to_delete.id}']", text: "Show details").click
      click_on "Delete food"

      expect(Food.exists?(food_to_delete.id)).to be(false)
    end
  end

  context "delete link" do
    it "redirects to the index", points: 0, hint: h("redirect_vs_render") do
      food_to_delete = create(:food)

      visit "/foods"
      find("a[href*='#{food_to_delete.id}']", text: "Show details").click
      click_on "Delete food"

      expect(page).to have_current_path("/foods")
    end
  end

  context "details page" do
    it "has an 'Edit food' link", points: 0 do
      food_to_edit = create(:food)

      visit "/foods"
      find("a[href*='#{food_to_edit.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Edit food")
    end
  end

  context "edit form" do
    it "has ingredient pre-populated", points: 0, hint: h("value_attribute") do
      test_ingredient = "Some fake pre-existing ingredient at #{Time.now}"
      food_to_edit = create(:food, ingredient: test_ingredient)

      visit "/foods"
      find("a[href*='#{food_to_edit.id}']", text: "Show details").click
      click_on "Edit food"

      expect(page).to have_css("input[value='#{test_ingredient}']")
    end
  end

  context "edit form" do
    it "has spice pre-populated", points: 0, hint: h("value_attribute") do
      test_spice = "Some fake pre-existing spice at #{Time.now}"
      food_to_edit = create(:food, spice: test_spice)

      visit "/foods"
      find("a[href*='#{food_to_edit.id}']", text: "Show details").click
      click_on "Edit food"

      expect(page).to have_css("input[value='#{test_spice}']")
    end
  end

  context "edit form" do
    it "has measurement pre-populated", points: 0, hint: h("value_attribute") do
      test_measurement = "Some fake pre-existing measurement at #{Time.now}"
      food_to_edit = create(:food, measurement: test_measurement)

      visit "/foods"
      find("a[href*='#{food_to_edit.id}']", text: "Show details").click
      click_on "Edit food"

      expect(page).to have_css("input[value='#{test_measurement}']")
    end
  end

  context "edit form" do
    it "updates ingredient when submitted", points: 0, hint: h("label_for_input button_type") do
      food_to_edit = create(:food, ingredient: "Boring old ingredient")

      visit "/foods"
      find("a[href*='#{food_to_edit.id}']", text: "Show details").click
      click_on "Edit food"

      test_ingredient = "Exciting new ingredient at #{Time.now}"
      fill_in "Ingredient", with: test_ingredient
      click_on "Update food"

      photo_as_revised = Food.find(food_to_edit.id)

      expect(photo_as_revised.ingredient).to eq(test_ingredient)
    end
  end

  context "edit form" do
    it "updates spice when submitted", points: 0, hint: h("label_for_input button_type") do
      food_to_edit = create(:food, spice: "Boring old spice")

      visit "/foods"
      find("a[href*='#{food_to_edit.id}']", text: "Show details").click
      click_on "Edit food"

      test_spice = "Exciting new spice at #{Time.now}"
      fill_in "Spice", with: test_spice
      click_on "Update food"

      photo_as_revised = Food.find(food_to_edit.id)

      expect(photo_as_revised.spice).to eq(test_spice)
    end
  end

  context "edit form" do
    it "updates measurement when submitted", points: 0, hint: h("label_for_input button_type") do
      food_to_edit = create(:food, measurement: "Boring old measurement")

      visit "/foods"
      find("a[href*='#{food_to_edit.id}']", text: "Show details").click
      click_on "Edit food"

      test_measurement = "Exciting new measurement at #{Time.now}"
      fill_in "Measurement", with: test_measurement
      click_on "Update food"

      photo_as_revised = Food.find(food_to_edit.id)

      expect(photo_as_revised.measurement).to eq(test_measurement)
    end
  end

  context "edit form" do
    it "redirects to the details page", points: 4, hint: h("embed_vs_interpolate redirect_vs_render") do
      food_to_edit = create(:food)

      visit "/foods"
      find("a[href*='#{food_to_edit.id}']", text: "Show details").click
      click_on "Edit food"
      click_on "Update food"

      expect(page).to have_current_path(/.*#{food_to_edit.id}.*/)
    end
  end

  context "details page" do
    it "displays latitude and longitude", points: 3 do
      food_to_geocode = create(:food, store_address: "2461 N Lincoln Ave, Chicago, IL 60614")

      visit "/foods"
      find("a[href*='#{food_to_geocode.id}']", text: "Show details").click

      expect(page).to have_content("38.89")
      expect(page).to have_content("-77.03")
    end
  end
end
