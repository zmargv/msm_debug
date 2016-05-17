require "rails_helper"

feature "READ:" do
  scenario "INDEX: directors#index RCAV works", points: 1 do
    visit "/directors"

    expect(page)
  end

  scenario "INDEX: directors#index displays a list of rows", points: 1 do
    first_director = FactoryGirl.create(:director, :name => "first")
    second_director = FactoryGirl.create(:director, :name => "second")

    visit "/directors"

    expect(page).to have_content(first_director.dob)
    expect(page).to have_content(first_director.name)
    expect(page).to have_content(first_director.bio)
    expect(page).to have_css("img[src*='#{first_director.image_url}']")
    expect(page).to have_content(second_director.dob)
    expect(page).to have_content(second_director.name)
    expect(page).to have_content(second_director.bio)
    expect(page).to have_css("img[src*='#{second_director.image_url}']")
  end

  scenario "SHOW: directors#show RCAV works", points: 1 do
    director = FactoryGirl.create(:director)

    visit "/directors"
    all('.btn-primary').last.click

    expect(page)
  end

  scenario "SHOW: directors#show displays row details", points: 1 do
    director = FactoryGirl.create(:director)

    visit "/directors"
    all('.btn-primary').last.click

    expect(page).to have_content(director.dob)
    expect(page).to have_content(director.name)
    expect(page).to have_content(director.bio)
    expect(page).to have_css("img[src*='#{director.image_url}']")
  end

end
