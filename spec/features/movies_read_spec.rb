require "rails_helper"

feature "READ:" do
  scenario "INDEX: movies#index RCAV works", points: 1 do
    visit "/movies"

    expect(page)
  end

  scenario "INDEX: movies#index displays a list of rows", points: 1 do
    first_movie = FactoryGirl.create(:movie)
    second_movie = FactoryGirl.create(:movie)

    visit "/movies"

    expect(page).to have_content(first_movie.title)
    expect(page).to have_content(first_movie.year)
    expect(page).to have_content(first_movie.duration)
    expect(page).to have_content(first_movie.description)
    expect(page).to have_content(first_movie.director_id)
    expect(page).to have_css("img[src*='#{first_movie.image_url}']")
    expect(page).to have_content(second_movie.title)
    expect(page).to have_content(second_movie.year)
    expect(page).to have_content(second_movie.duration)
    expect(page).to have_content(second_movie.description)
    expect(page).to have_content(second_movie.director_id)
    expect(page).to have_css("img[src*='#{second_movie.image_url}']")
  end

  scenario "SHOW: movies#show RCAV works", points: 1 do
    movie = FactoryGirl.create(:movie)

    visit "/movies"
    all('.btn-primary').last.click

    expect(page)
  end

  scenario "SHOW: movies#show displays row details", points: 1 do
    movie = FactoryGirl.create(:movie)

    visit "/movies"
    all('.btn-primary').last.click

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.year)
    expect(page).to have_content(movie.duration)
    expect(page).to have_content(movie.description)
    expect(page).to have_content(movie.director_id)
    expect(page).to have_css("img[src*='#{movie.image_url}']")
  end

end
