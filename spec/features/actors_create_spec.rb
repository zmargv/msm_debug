require "rails_helper"

feature "CREATE:" do
  scenario "NEW FORM: actors#new_form RCAV works", points: 1 do
    visit "/actors"
    find('a', :text => /new/i).click

    expect(page)
  end

  scenario "NEW FORM: actors#new_form has input elements with agreed-upon input labels", points: 1 do
    visit "/actors"
    find('a', :text => /new/i).click

    expect(page).to have_selector("form", count: 1)
    expect(page).to have_selector("label", text: "Dob")
    expect(page).to have_selector("label", text: "Name")
    expect(page).to have_selector("label", text: "Bio")
    expect(page).to have_selector("label", text: "Image url")
  end

  scenario "CREATE ROW: actors#create_row creates new row", points: 1 do
    starting_count = Actor.count
    row_dob ="January 1, 1980"
    row_name = "Ana Lily Amirpour"
    row_bio = "See http://www.imdb.com/name/nm3235877/"
    row_image_url = "http://ia.media-imdb.com/images/M/MV5BMjI1MTk0MjQwMF5BMl5BanBnXkFtZTgwNzM3MjIwMTE@._V1_UX214_CR0,0,214,317_AL_.jpg"

    visit "/actors"
    find('a', :text => /new/i).click
    fill_in("Dob", with: row_dob)
    fill_in("Name", with: row_name)
    fill_in("Bio", with: row_bio)
    fill_in("Image url", with: row_image_url)
    click_on "Create Actor"

    last_row = Actor.last
    final_count = Actor.count
    expect(starting_count + 1).to eq(final_count)
    expect(last_row.dob).to eq(row_dob)
    expect(last_row.name).to eq(row_name)
    expect(last_row.bio).to eq(row_bio)
    expect(last_row.image_url).to eq(row_image_url)
  end

end
