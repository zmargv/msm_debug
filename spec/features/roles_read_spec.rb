require "rails_helper"

feature "READ:" do
  scenario "INDEX: roles#index RCAV works", points: 1 do
    visit "/roles"

    expect(page)
  end

  scenario "INDEX: roles#index displays a list of rows", points: 1 do
    director = FactoryGirl.create(:director)
    actor = FactoryGirl.create(:actor)
    movie = FactoryGirl.create(:movie)
    first_role = FactoryGirl.create(:role, :character_name => "Superman")
    second_role = FactoryGirl.create(:role, :character_name => "Batman")

    visit "/roles"

    expect(page).to have_content(first_role.character_name)
    expect(page).to have_content(first_role.movie_id)
    expect(page).to have_content(first_role.actor_id)
    expect(page).to have_content(second_role.character_name)
    expect(page).to have_content(second_role.movie_id)
    expect(page).to have_content(second_role.actor_id)
  end

  scenario "SHOW: roles#show RCAV works", points: 1 do
    role = FactoryGirl.create(:role)

    visit "/roles"
    all('.btn-primary').last.click

    expect(page)
  end

  scenario "SHOW: roles#show displays row details", points: 1 do
    role = FactoryGirl.create(:role)

    visit "/roles"
    all('.btn-primary').last.click

    expect(page).to have_content(role.character_name)
    expect(page).to have_content(role.movie_id)
    expect(page).to have_content(role.actor_id)
  end

end
