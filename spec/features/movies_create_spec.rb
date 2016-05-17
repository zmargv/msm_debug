require "rails_helper"

feature "CREATE:" do
  scenario "NEW FORM: movies#new_form RCAV works", points: 1 do
    visit "/movies"
    find('a', :text => /new/i).click

    expect(page)
  end

  scenario "NEW FORM: movies#new_form has input elements with agreed-upon input labels", points: 1 do
    visit "/movies"
    find('a', :text => /new/i).click

    expect(page).to have_selector("form", count: 1)
    expect(page).to have_selector("label", text: "Title")
    expect(page).to have_selector("label", text: "Year")
    expect(page).to have_selector("label", text: "Duration")
    expect(page).to have_selector("label", text: "Description")
    expect(page).to have_selector("label", text: "Image url")
    expect(page).to have_selector("label", text: "Director")
  end

  scenario "CREATE ROW: movies#create_row creates new row", points: 1 do
    director = FactoryGirl.create(:director)
    movie_title = "The Godfather: Part VX"
    movie_year = "2016"
    movie_duration = 180
    movie_description = "Not a real movie"
    movie_image_url = "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Lake_Bondhus_Norway_2862.jpg/1280px-Lake_Bondhus_Norway_2862.jpg"
    movie_director_id = 1
    starting_movie_count = Movie.count

    visit "/movies"
    find('a', :text => /new/i).click
    fill_in("Title", with: movie_title)
    fill_in("Year", with: movie_year)
    fill_in("Duration", with: movie_duration)
    fill_in("Description", with: movie_description)
    fill_in("Image url", with: movie_image_url)
    select "#{Director.first.name}", from: "Director"
    click_on "Create Movie"

    last_movie = Movie.last
    final_movie_count = Movie.count
    expect(starting_movie_count + 1).to eq(final_movie_count)
    expect(last_movie.title).to eq(movie_title)
    expect(last_movie.year).to eq(movie_year)
    expect(last_movie.duration).to eq(movie_duration)
    expect(last_movie.description).to eq(movie_description)
    expect(last_movie.image_url).to eq(movie_image_url)
    expect(last_movie.director_id).to eq(Director.first.id)
  end

end
