require "rails_helper"

feature "UPDATE:" do
  scenario "EDIT FORM: actors#edit_form RCAV works", points: 1 do
    actor = FactoryGirl.create(:actor)

    visit "/actors"
    all('.btn-warning').last.click

    expect(page)
  end

  scenario "EDIT FORM: actors#edit_form has input elements with agreed-upon input labels", points: 1 do
    actor = FactoryGirl.create(:actor)

    visit "/actors"
    all('.btn-warning').last.click

    expect(page).to have_selector("form", count: 1)
    expect(page).to have_selector("input", count: 4)
    expect(page).to have_selector("label", text: "Dob")
    expect(page).to have_selector("label", text: "Name")
    expect(page).to have_selector("label", text: "Bio")
    expect(page).to have_selector("label", text: "Image url")
  end

  scenario "EDIT FORM: actors#edit_form has prepopulated input fields", points: 1 do
    actor = FactoryGirl.create(:actor)

    visit "/actors"
    all('.btn-warning').last.click

    expect(page).to have_selector("input[value='#{actor.dob}']")
    expect(page).to have_selector("input[value='#{actor.name}']")
    expect(page).to have_field('Bio', with: "#{actor.bio}")
    expect(page).to have_selector("input[value='#{actor.image_url}']")
  end

  scenario "UPDATE_ROW: actors#update_row updates row", points: 1 do
    actor = FactoryGirl.create(:actor)
    starting_count = Actor.count
    row_dob ="January 1, 1980"
    row_name = "Ana Lily Amirpour"
    row_bio = "See http://www.imdb.com/name/nm3235877/"
    row_image_url = "http://ia.media-imdb.com/images/M/MV5BMjI1MTk0MjQwMF5BMl5BanBnXkFtZTgwNzM3MjIwMTE@._V1_UX214_CR0,0,214,317_AL_.jpg"

    visit "/actors"
    all('.btn-warning').last.click
    fill_in("Dob", with: row_dob)
    fill_in("Name", with: row_name)
    fill_in("Bio", with: row_bio)
    fill_in("Image url", with: row_image_url)
    click_on "Update Actor"

    last_row = Actor.last
    final_count = Actor.count
    expect(starting_count).to eq(final_count)
    expect(last_row.dob).to eq(row_dob)
    expect(last_row.name).to eq(row_name)
    expect(last_row.bio).to eq(row_bio)
    expect(last_row.image_url).to eq(row_image_url)
  end

  scenario "UPDATE_ROW: actors#update_row redirects to details page", points: 1 do
    actor = FactoryGirl.create(:actor)

    visit "/actors"
    all('.btn-warning').last.click
    click_on "Update Actor"

    expect(page).to have_content(actor.dob)
    expect(page).to have_content(actor.name)
    expect(page).to have_content(actor.bio)
    expect(page).to have_css("img[src*='#{actor.image_url}']")
  end

end
