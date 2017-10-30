require "rails_helper"

feature "COFFEE BEANS" do
  context "index" do
    it "has the blend name of every row", points: 1 do
      test_coffee_beans = create_list(:coffee_bean, 5)

      visit "/coffee_beans"

      test_coffee_beans.each do |current_coffee_bean|
        expect(page).to have_content(current_coffee_bean.blend_name)
      end
    end
  end

  context "index" do
    it "has the origin of every row", points: 1 do
      test_coffee_beans = create_list(:coffee_bean, 5)

      visit "/coffee_beans"

      test_coffee_beans.each do |current_coffee_bean|
        expect(page).to have_content(current_coffee_bean.origin)
      end
    end
  end

  context "index" do
    it "has the variety of every row", points: 1 do
      test_coffee_beans = create_list(:coffee_bean, 5)

      visit "/coffee_beans"

      test_coffee_beans.each do |current_coffee_bean|
        expect(page).to have_content(current_coffee_bean.variety)
      end
    end
  end

  context "index" do
    it "has the notes of every row", points: 1 do
      test_coffee_beans = create_list(:coffee_bean, 5)

      visit "/coffee_beans"

      test_coffee_beans.each do |current_coffee_bean|
        expect(page).to have_content(current_coffee_bean.notes)
      end
    end
  end

  context "index" do
    it "has a link to the details page of every row", points: 0 do
      test_coffee_beans = create_list(:coffee_bean, 5)

      visit "/coffee_beans"

      test_coffee_beans.each do |current_coffee_bean|
        expect(page).to have_css("a[href*='#{current_coffee_bean.id}']", text: "Show details")
      end
    end
  end

  context "details page" do
    it "has the correct blend name", points: 1 do
      coffee_bean_to_show = create(:coffee_bean)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_show.id}']", text: "Show details").click

      expect(page).to have_content(coffee_bean_to_show.blend_name)
    end
  end

  context "details page" do
    it "has the correct origin", points: 1 do
      coffee_bean_to_show = create(:coffee_bean)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_show.id}']", text: "Show details").click

      expect(page).to have_content(coffee_bean_to_show.origin)
    end
  end

  context "details page" do
    it "has the correct variety", points: 1 do
      coffee_bean_to_show = create(:coffee_bean)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_show.id}']", text: "Show details").click

      expect(page).to have_content(coffee_bean_to_show.variety)
    end
  end

  context "details page" do
    it "has the correct notes", points: 1 do
      coffee_bean_to_show = create(:coffee_bean)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_show.id}']", text: "Show details").click

      expect(page).to have_content(coffee_bean_to_show.notes)
    end
  end

  context "index" do
    it "has a link to the new coffee bean page", points: 0 do
      visit "/coffee_beans"

      expect(page).to have_css("a", text: "Add a new coffee bean")
    end
  end

  context "new form" do
    it "saves the blend name when submitted", points: 2, hint: h("label_for_input") do
      visit "/coffee_beans"
      click_on "Add a new coffee bean"

      test_blend_name = "A fake blend name I'm typing at #{Time.now}"
      fill_in "Blend name", with: test_blend_name
      click_on "Create coffee bean"

      last_coffee_bean = CoffeeBean.order(created_at: :asc).last
      expect(last_coffee_bean.blend_name).to eq(test_blend_name)
    end
  end

  context "new form" do
    it "saves the origin when submitted", points: 2, hint: h("label_for_input") do
      visit "/coffee_beans"
      click_on "Add a new coffee bean"

      test_origin = "A fake origin I'm typing at #{Time.now}"
      fill_in "Origin", with: test_origin
      click_on "Create coffee bean"

      last_coffee_bean = CoffeeBean.order(created_at: :asc).last
      expect(last_coffee_bean.origin).to eq(test_origin)
    end
  end

  context "new form" do
    it "saves the variety when submitted", points: 2, hint: h("label_for_input") do
      visit "/coffee_beans"
      click_on "Add a new coffee bean"

      test_variety = "A fake variety I'm typing at #{Time.now}"
      fill_in "Variety", with: test_variety
      click_on "Create coffee bean"

      last_coffee_bean = CoffeeBean.order(created_at: :asc).last
      expect(last_coffee_bean.variety).to eq(test_variety)
    end
  end

  context "new form" do
    it "saves the notes when submitted", points: 2, hint: h("label_for_input") do
      visit "/coffee_beans"
      click_on "Add a new coffee bean"

      test_notes = "A fake notes I'm typing at #{Time.now}"
      fill_in "Notes", with: test_notes
      click_on "Create coffee bean"

      last_coffee_bean = CoffeeBean.order(created_at: :asc).last
      expect(last_coffee_bean.notes).to eq(test_notes)
    end
  end

  context "new form" do
    it "redirects to the index when submitted", points: 0, hint: h("redirect_vs_render") do
      visit "/coffee_beans"
      click_on "Add a new coffee bean"

      click_on "Create coffee bean"

      expect(page).to have_current_path("/coffee_beans")
    end
  end

  context "details page" do
    it "has a 'Delete coffee bean' link", points: 0 do
      coffee_bean_to_delete = create(:coffee_bean)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_delete.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Delete")
    end
  end

  context "delete link" do
    it "removes a row from the table", points: 0 do
      coffee_bean_to_delete = create(:coffee_bean)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_delete.id}']", text: "Show details").click
      click_on "Delete coffee bean"

      expect(CoffeeBean.exists?(coffee_bean_to_delete.id)).to be(false)
    end
  end

  context "delete link" do
    it "redirects to the index", points: 2, hint: h("redirect_vs_render") do
      coffee_bean_to_delete = create(:coffee_bean)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_delete.id}']", text: "Show details").click
      click_on "Delete coffee bean"

      expect(page).to have_current_path("/coffee_beans")
    end
  end

  context "details page" do
    it "has an 'Edit coffee bean' link", points: 5 do
      coffee_bean_to_edit = create(:coffee_bean)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_edit.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Edit coffee bean")
    end
  end

  context "edit form" do
    it "has blend name pre-populated", points: 2, hint: h("value_attribute") do
      test_blend_name = "Some fake pre-existing blend name at #{Time.now}"
      coffee_bean_to_edit = create(:coffee_bean, blend_name: test_blend_name)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_edit.id}']", text: "Show details").click
      click_on "Edit coffee bean"

      expect(page).to have_css("input[value='#{test_blend_name}']")
    end
  end

  context "edit form" do
    it "has origin pre-populated", points: 2, hint: h("value_attribute") do
      test_origin = "Some fake pre-existing origin at #{Time.now}"
      coffee_bean_to_edit = create(:coffee_bean, origin: test_origin)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_edit.id}']", text: "Show details").click
      click_on "Edit coffee bean"

      expect(page).to have_css("input[value='#{test_origin}']")
    end
  end

  context "edit form" do
    it "has variety pre-populated", points: 2, hint: h("value_attribute") do
      test_variety = "Some fake pre-existing variety at #{Time.now}"
      coffee_bean_to_edit = create(:coffee_bean, variety: test_variety)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_edit.id}']", text: "Show details").click
      click_on "Edit coffee bean"

      expect(page).to have_css("input[value='#{test_variety}']")
    end
  end

  context "edit form" do
    it "has notes pre-populated", points: 2, hint: h("value_attribute") do
      test_notes = "Some fake pre-existing notes at #{Time.now}"
      coffee_bean_to_edit = create(:coffee_bean, notes: test_notes)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_edit.id}']", text: "Show details").click
      click_on "Edit coffee bean"

      expect(page).to have_css("input[value='#{test_notes}']")
    end
  end

  context "edit form" do
    it "updates blend name when submitted", points: 1, hint: h("label_for_input button_type") do
      coffee_bean_to_edit = create(:coffee_bean, blend_name: "Boring old blend name")

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_edit.id}']", text: "Show details").click
      click_on "Edit coffee bean"

      test_blend_name = "Exciting new blend name at #{Time.now}"
      fill_in "Blend name", with: test_blend_name
      click_on "Update coffee bean"

      photo_as_revised = CoffeeBean.find(coffee_bean_to_edit.id)

      expect(photo_as_revised.blend_name).to eq(test_blend_name)
    end
  end

  context "edit form" do
    it "updates origin when submitted", points: 1, hint: h("label_for_input button_type") do
      coffee_bean_to_edit = create(:coffee_bean, origin: "Boring old origin")

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_edit.id}']", text: "Show details").click
      click_on "Edit coffee bean"

      test_origin = "Exciting new origin at #{Time.now}"
      fill_in "Origin", with: test_origin
      click_on "Update coffee bean"

      photo_as_revised = CoffeeBean.find(coffee_bean_to_edit.id)

      expect(photo_as_revised.origin).to eq(test_origin)
    end
  end

  context "edit form" do
    it "updates variety when submitted", points: 1, hint: h("label_for_input button_type") do
      coffee_bean_to_edit = create(:coffee_bean, variety: "Boring old variety")

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_edit.id}']", text: "Show details").click
      click_on "Edit coffee bean"

      test_variety = "Exciting new variety at #{Time.now}"
      fill_in "Variety", with: test_variety
      click_on "Update coffee bean"

      photo_as_revised = CoffeeBean.find(coffee_bean_to_edit.id)

      expect(photo_as_revised.variety).to eq(test_variety)
    end
  end

  context "edit form" do
    it "updates notes when submitted", points: 1, hint: h("label_for_input button_type") do
      coffee_bean_to_edit = create(:coffee_bean, notes: "Boring old notes")

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_edit.id}']", text: "Show details").click
      click_on "Edit coffee bean"

      test_notes = "Exciting new notes at #{Time.now}"
      fill_in "Notes", with: test_notes
      click_on "Update coffee bean"

      photo_as_revised = CoffeeBean.find(coffee_bean_to_edit.id)

      expect(photo_as_revised.notes).to eq(test_notes)
    end
  end

  context "edit form" do
    it "redirects to the details page", points: 0, hint: h("embed_vs_interpolate redirect_vs_render") do
      coffee_bean_to_edit = create(:coffee_bean)

      visit "/coffee_beans"
      find("a[href*='#{coffee_bean_to_edit.id}']", text: "Show details").click
      click_on "Edit coffee bean"
      click_on "Update coffee bean"

      expect(page).to have_current_path(/.*#{coffee_bean_to_edit.id}.*/)
    end
  end
end
