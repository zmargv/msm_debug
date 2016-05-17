require "rails_helper"

feature "READ:" do
  scenario "INDEX: actors#index RCAV works", points: 1 do
    visit "/actors"

    expect(page)
  end

  scenario "INDEX: actors#index displays a list of rows", points: 1 do
    first_actor = FactoryGirl.create(:actor, :name => "first")
    second_actor = FactoryGirl.create(:actor, :name => "second")

    visit "/actors"

    expect(page).to have_content(first_actor.dob)
    expect(page).to have_content(first_actor.name)
    expect(page).to have_content(first_actor.bio)
    expect(page).to have_css("img[src*='#{first_actor.image_url}']")
    expect(page).to have_content(second_actor.dob)
    expect(page).to have_content(second_actor.name)
    expect(page).to have_content(second_actor.bio)
    expect(page).to have_css("img[src*='#{second_actor.image_url}']")
  end

  scenario "SHOW: actors#show RCAV works", points: 1 do
    actor = FactoryGirl.create(:actor)

    visit "/actors"
    all('.btn-primary').last.click

    expect(page)
  end

  scenario "SHOW: actors#show displays row details", points: 1 do
    actor = FactoryGirl.create(:actor)

    visit "/actors"
    all('.btn-primary').last.click

    expect(page).to have_content(actor.dob)
    expect(page).to have_content(actor.name)
    expect(page).to have_content(actor.bio)
    expect(page).to have_css("img[src*='#{actor.image_url}']")
  end

end
