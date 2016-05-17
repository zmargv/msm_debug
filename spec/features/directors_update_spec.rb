require "rails_helper"

feature "UPDATE:" do
  scenario "EDIT FORM: directors#edit_form RCAV works", points: 1 do
    director = FactoryGirl.create(:director)

    visit "/directors"
    all('.btn-warning').last.click

    expect(page)
  end

  scenario "EDIT FORM: directors#edit_form has input elements with agreed-upon input labels", points: 1 do
    director = FactoryGirl.create(:director)

    visit "/directors"
    all('.btn-warning').last.click

    expect(page).to have_selector("form", count: 1)
    expect(page).to have_selector("input", count: 4)
    expect(page).to have_selector("label", text: "Dob")
    expect(page).to have_selector("label", text: "Name")
    expect(page).to have_selector("label", text: "Bio")
    expect(page).to have_selector("label", text: "Image url")
  end

  scenario "EDIT FORM: directors#edit_form has prepopulated input fields", points: 1 do
    director = FactoryGirl.create(:director)

    visit "/directors"
    all('.btn-warning').last.click

    expect(page).to have_selector("input[value='#{director.dob}']")
    expect(page).to have_selector("input[value='#{director.name}']")
    expect(page).to have_field('Bio', with: "#{director.bio}")
    expect(page).to have_selector("input[value='#{director.image_url}']")
  end

  scenario "UPDATE_ROW: directors#update_row updates row", points: 1 do
    director = FactoryGirl.create(:director)
    starting_director_count = Director.count
    director_dob ="January 1, 1980"
    director_name = "Ana Lily Amirpour"
    director_bio = "See http://www.imdb.com/name/nm3235877/"
    director_image_url = "http://ia.media-imdb.com/images/M/MV5BMjI1MTk0MjQwMF5BMl5BanBnXkFtZTgwNzM3MjIwMTE@._V1_UX214_CR0,0,214,317_AL_.jpg"

    visit "/directors"
    all('.btn-warning').last.click
    fill_in("Dob", with: director_dob)
    fill_in("Name", with: director_name)
    fill_in("Bio", with: director_bio)
    fill_in("Image url", with: director_image_url)
    click_on "Update Director"

    updated_director = Director.find(director.id)
    final_director_count = Director.count
    expect(starting_director_count).to eq(final_director_count)
    expect(updated_director.dob).to eq(director_dob)
    expect(updated_director.name).to eq(director_name)
    expect(updated_director.bio).to eq(director_bio)
    expect(updated_director.image_url).to eq(director_image_url)
  end

  scenario "UPDATE_ROW: directors#update_row redirects to details page", points: 1 do
    director = FactoryGirl.create(:director)

    visit "/directors"
    all('.btn-warning').last.click
    click_on "Update Director"

    expect(page).to have_content(director.dob)
    expect(page).to have_content(director.name)
    expect(page).to have_content(director.bio)
    expect(page).to have_css("img[src*='#{director.image_url}']")
  end

end
