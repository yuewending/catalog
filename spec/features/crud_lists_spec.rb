require "rails_helper"

feature "LISTS" do
  context "index" do
    it "has the title of every row", points: 5 do
      test_lists = create_list(:list, 5)

      visit "/lists"

      test_lists.each do |current_list|
        expect(page).to have_content(current_list.title)
      end
    end
  end

  context "index" do
    it "has the description of every row", points: 5 do
      test_lists = create_list(:list, 5)

      visit "/lists"

      test_lists.each do |current_list|
        expect(page).to have_content(current_list.description)
      end
    end
  end

  context "index" do
    it "has a link to the details page of every row", points: 5 do
      test_lists = create_list(:list, 5)

      visit "/lists"

      test_lists.each do |current_list|
        expect(page).to have_css("a[href*='#{current_list.id}']", text: "Show details")
      end
    end
  end

  context "details page" do
    it "has the correct title", points: 3 do
      list_to_show = create(:list)

      visit "/lists"
      find("a[href*='#{list_to_show.id}']", text: "Show details").click

      expect(page).to have_content(list_to_show.title)
    end
  end

  context "details page" do
    it "has the correct description", points: 3 do
      list_to_show = create(:list)

      visit "/lists"
      find("a[href*='#{list_to_show.id}']", text: "Show details").click

      expect(page).to have_content(list_to_show.description)
    end
  end

  context "index" do
    it "has a link to the new list page", points: 2 do
      visit "/lists"

      expect(page).to have_css("a", text: "Add a new list")
    end
  end

  context "new form" do
    it "saves the title when submitted", points: 2, hint: h("label_for_input") do
      visit "/lists"
      click_on "Add a new list"

      test_title = "A fake title I'm typing at #{Time.now}"
      fill_in "Title", with: test_title

      click_on "Create list"

      last_list = List.order(created_at: :asc).last
      expect(last_list.title).to eq(test_title)
    end
  end

  context "new form" do
    it "saves the description when submitted", points: 2, hint: h("label_for_input") do
      visit "/lists"
      click_on "Add a new list"

      test_description = "A fake description I'm typing at #{Time.now}"
      fill_in "Description", with: test_description

      click_on "Create list"

      last_list = List.order(created_at: :asc).last
      expect(last_list.description).to eq(test_description)
    end
  end

  context "new form" do
    it "redirects to the index when submitted", points: 2, hint: h("redirect_vs_render") do
      visit "/lists"
      click_on "Add a new list"

      click_on "Create list"

      expect(page).to have_current_path("/lists")
    end
  end

  context "details page" do
    it "has a 'Delete list' link", points: 2 do
      list_to_delete = create(:list)

      visit "/lists"
      find("a[href*='#{list_to_delete.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Delete")
    end
  end

  context "delete link" do
    it "removes a row from the table", points: 5 do
      list_to_delete = create(:list)

      visit "/lists"
      find("a[href*='#{list_to_delete.id}']", text: "Show details").click
      click_on "Delete list"

      expect(List.exists?(list_to_delete.id)).to be(false)
    end
  end

  context "delete link" do
    it "redirects to the index", points: 3, hint: h("redirect_vs_render") do
      list_to_delete = create(:list)

      visit "/lists"
      find("a[href*='#{list_to_delete.id}']", text: "Show details").click
      click_on "Delete list"

      expect(page).to have_current_path("/lists")
    end
  end

  context "details page" do
    it "has an 'Edit list' link", points: 5 do
      list_to_edit = create(:list)

      visit "/lists"
      find("a[href*='#{list_to_edit.id}']", text: "Show details").click

      expect(page).to have_css("a", text: "Edit list")
    end
  end

  context "edit form" do
    it "has title pre-populated", points: 3, hint: h("value_attribute") do
      list_to_edit = create(:list)

      visit "/lists"
      find("a[href*='#{list_to_edit.id}']", text: "Show details").click
      click_on "Edit list"

      expect(page).to have_css("input[value='#{list_to_edit.title}']")
    end
  end

  context "edit form" do
    it "has description pre-populated", points: 3, hint: h("value_attribute") do
      list_to_edit = create(:list)

      visit "/lists"
      find("a[href*='#{list_to_edit.id}']", text: "Show details").click
      click_on "Edit list"

      expect(page).to have_css("input[value='#{list_to_edit.description}']")
    end
  end

  context "edit form" do
    it "updates title when submitted", points: 5, hint: h("label_for_input button_type") do
      list_to_edit = create(:list, title: "Boring old title")

      visit "/lists"
      find("a[href*='#{list_to_edit.id}']", text: "Show details").click
      click_on "Edit list"

      test_title = "Exciting new title at #{Time.now}"
      fill_in "Title", with: test_title

      click_on "Update list"

      list_as_revised = List.find(list_to_edit.id)

      expect(list_as_revised.title).to eq(test_title)
    end
  end

  context "edit form" do
    it "updates description when submitted", points: 5, hint: h("label_for_input button_type") do
      list_to_edit = create(:list, description: "Boring old description")

      visit "/lists"
      find("a[href*='#{list_to_edit.id}']", text: "Show details").click
      click_on "Edit list"

      test_description = "Exciting new description at #{Time.now}"
      fill_in "Description", with: test_description

      click_on "Update list"

      list_as_revised = List.find(list_to_edit.id)

      expect(list_as_revised.description).to eq(test_description)
    end
  end

  context "edit form" do
    it "redirects to the details page", points: 3, hint: h("embed_vs_interpolate redirect_vs_render") do
      list_to_edit = create(:list)

      visit "/lists"
      find("a[href*='#{list_to_edit.id}']", text: "Show details").click
      details_page_path = page.current_path

      click_on "Edit list"
      click_on "Update list"

      expect(page).to have_current_path(details_page_path, only_path: true)
    end
  end
end
