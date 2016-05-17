require "rails_helper"

feature "CREATE:" do
  scenario "NEW FORM: roles#new_form RCAV works", points: 1 do
    visit "/roles"
    find('a', :text => /new/i).click

    expect(page)
  end

  scenario "NEW FORM: roles#new_form has input elements with agreed-upon input labels", points: 1 do
    visit "/roles"
    find('a', :text => /new/i).click

    expect(page).to have_selector("form", count: 1)
    expect(page).to have_selector("label", text: "Character name")
    expect(page).to have_selector("label", text: "Movie")
    expect(page).to have_selector("label", text: "Actor")
  end

  scenario "CREATE ROW: roles#create_row creates new row", points: 1 do
    movie = FactoryGirl.create(:movie)
    actor = FactoryGirl.create(:actor)
    row_character_name = "Super super superman"
    starting_count = Role.count

    visit "/roles"
    find('a', :text => /new/i).click
    fill_in("Character name", with: row_character_name)
    select "#{movie.title}", from: "Movie"
    select "#{actor.name}", from: "Actor"
    click_on "Create Role"

    last_row = Role.last
    final_count = Role.count
    expect(starting_count + 1).to eq(final_count)
    expect(last_row.character_name).to eq(row_character_name)
    expect(last_row.movie_id).to eq(movie.id)
    expect(last_row.actor_id).to eq(actor.id)
  end

end
