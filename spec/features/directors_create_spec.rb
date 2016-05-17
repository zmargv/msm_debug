require "rails_helper"

feature "CREATE:" do
  scenario "NEW FORM: directors#new_form RCAV works", points: 1 do
    visit "/directors"
    find('a', :text => /new/i).click

    expect(page)
  end

  scenario "NEW FORM: directors#new_form has input elements with agreed-upon input labels", points: 1 do
    visit "/directors"
    find('a', :text => /new/i).click

    expect(page).to have_selector("form", count: 1)
    expect(page).to have_selector("label", text: "Dob")
    expect(page).to have_selector("label", text: "Name")
    expect(page).to have_selector("label", text: "Bio")
    expect(page).to have_selector("label", text: "Image url")
  end

  scenario "CREATE ROW: directors#create_row creates new row", points: 1 do
    starting_director_count = Director.count
    director_dob ="January 1, 1980"
    director_name = "Ana Lily Amirpour"
    director_bio = "See http://www.imdb.com/name/nm3235877/"
    director_image_url = "http://ia.media-imdb.com/images/M/MV5BMjI1MTk0MjQwMF5BMl5BanBnXkFtZTgwNzM3MjIwMTE@._V1_UX214_CR0,0,214,317_AL_.jpg"

    visit "/directors"
    find('a', :text => /new/i).click
    fill_in("Dob", with: director_dob)
    fill_in("Name", with: director_name)
    fill_in("Bio", with: director_bio)
    fill_in("Image url", with: director_image_url)
    click_on "Create Director"

    last_director = Director.last
    final_director_count = Director.count
    expect(starting_director_count + 1).to eq(final_director_count)
    expect(last_director.dob).to eq(director_dob)
    expect(last_director.name).to eq(director_name)
    expect(last_director.bio).to eq(director_bio)
    expect(last_director.image_url).to eq(director_image_url)
  end

end
