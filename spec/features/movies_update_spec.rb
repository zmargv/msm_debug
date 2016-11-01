require "rails_helper"

feature "UPDATE:" do
  scenario "EDIT FORM: movies#edit_form RCAV works", points: 1 do
    movie = FactoryGirl.create(:movie)

    visit "/movies"
    all('.btn-warning').last.click

    expect(page)
  end

  scenario "EDIT FORM: movies#edit_form has input elements with agreed-upon input labels", points: 1 do
    movie = FactoryGirl.create(:movie)

    visit "/movies"
    all('.btn-warning').last.click

    expect(page).to have_selector("form", count: 1)
    expect(page).to have_selector("input", count: 5)
    expect(page).to have_selector("label", text: "Title")
    expect(page).to have_selector("label", text: "Year")
    expect(page).to have_selector("label", text: "Duration")
    expect(page).to have_selector("label", text: "Description")
    expect(page).to have_selector("label", text: "Image url")
    expect(page).to have_selector("select", count: 1)
    expect(page).to have_selector("label", text: "Director")
  end

  scenario "EDIT FORM: movies#edit_form has prepopulated input fields", points: 1 do
    movie = FactoryGirl.create(:movie)
    director = FactoryGirl.create(:director)
    movie_director = Director.find(movie.director_id)

    visit "/movies"
    all('.btn-warning').last.click

    expect(page).to have_selector("input[value='#{movie.title}']")
    expect(page).to have_selector("input[value='#{movie.year}']")
    expect(page).to have_selector("input[value='#{movie.duration}']")
    expect(page).to have_field('Description', with: "#{movie.description}")
    expect(page).to have_selector("input[value='#{movie.image_url}']")
    expect(page).to have_select('Director', selected: "#{movie_director.name}")
  end

  scenario "UPDATE_ROW: movies#update_row updates row", points: 1 do
    movie = FactoryGirl.create(:movie)
    director = FactoryGirl.create(:director, :name => "first")
    second_director = FactoryGirl.create(:director, :name => "second")
    starting_movie_count = Movie.count
    movie_title = "The Godfather: Part M"
    movie_year = "2022"
    movie_duration = 250
    movie_description = "Real movie"
    movie_image_url = "http://www.google.com/notreal"
    movie_director_id = second_director.id

    visit "/movies"
    all('.btn-warning').last.click
    fill_in("Title", with: movie_title)
    fill_in("Year", with: movie_year)
    fill_in("Duration", with: movie_duration)
    fill_in("Description", with: movie_description)
    fill_in("Image url", with: movie_image_url)
    select "#{second_director.name}", from: "Director"
    click_on "Update Movie"

    updated_movie = Movie.find(movie.id)
    final_movie_count = Movie.count
    expect(starting_movie_count).to eq(final_movie_count)
    expect(updated_movie.title).to eq(movie_title)
    expect(updated_movie.year).to eq(movie_year)
    expect(updated_movie.duration).to eq(movie_duration)
    expect(updated_movie.description).to eq(movie_description)
    expect(updated_movie.image_url).to eq(movie_image_url)
    expect(updated_movie.director_id).to eq(movie_director_id)
  end

  scenario "UPDATE_ROW: movies#update_row redirects to details page", points: 1 do
    movie = FactoryGirl.create(:movie)

    visit "/movies"
    all('.btn-warning').last.click
    click_on "Update Movie"

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.year)
    expect(page).to have_content(movie.duration)
    expect(page).to have_content(movie.description)
    expect(page).to have_content(movie.director_id)
    expect(page).to have_css("img[src*='#{movie.image_url}']")
  end

end
