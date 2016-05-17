require "rails_helper"

feature "UPDATE:" do
  scenario "EDIT FORM: roles#edit_form RCAV works", points: 1 do
    role = FactoryGirl.create(:role)

    visit "/roles"
    all('.btn-warning').last.click

    expect(page)
  end

  scenario "EDIT FORM: roles#edit_form has input elements with agreed-upon input labels", points: 1 do
    role = FactoryGirl.create(:role)

    visit "/roles"
    all('.btn-warning').last.click

    expect(page).to have_selector("form", count: 1)
    expect(page).to have_selector("label", text: "Character name")
    expect(page).to have_selector("label", text: "Movie")
    expect(page).to have_selector("label", text: "Actor")
  end

  scenario "EDIT FORM: roles#edit_form has prepopulated input fields", points: 1 do
    movie = FactoryGirl.create(:movie)
    actor = FactoryGirl.create(:actor)
    role = FactoryGirl.create(:role, :movie_id => movie.id, :actor_id => actor.id)

    visit "/roles"
    all('.btn-warning').last.click

    expect(page).to have_selector("input[value='#{role.character_name}']")
    expect(page).to have_select('movie_id', selected: "#{Movie.find(role.movie_id).title}")
    expect(page).to have_select('actor_id', selected: "#{Actor.find(role.actor_id).name}")
  end

  scenario "UPDATE_ROW: roles#update_row updates row", points: 1 do
    movie = FactoryGirl.create(:movie, :title => "A different title")
    actor = FactoryGirl.create(:actor, :name => "A different name")
    role = FactoryGirl.create(:role)
    starting_count = Role.count
    row_character_name = "Super super superman"

    visit "/roles"
    all('.btn-warning').last.click
    fill_in("Character name", with: row_character_name)
    select "#{movie.title}", from: "Movie"
    select "#{actor.name}", from: "Actor"
    click_on "Update Role"

    last_row = Role.last
    final_count = Role.count
    expect(starting_count).to eq(final_count)
    expect(last_row.character_name).to eq(row_character_name)
    expect(last_row.movie_id).to eq(movie.id)
    expect(last_row.actor_id).to eq(actor.id)
  end

  scenario "UPDATE_ROW: roles#update_row redirects to details page", points: 1 do
    role = FactoryGirl.create(:role)

    visit "/roles"
    all('.btn-warning').last.click
    click_on "Update Role"

    expect(page).to have_content(role.character_name)
    expect(page).to have_content(role.movie_id)
    expect(page).to have_content(role.actor_id)
  end

end
