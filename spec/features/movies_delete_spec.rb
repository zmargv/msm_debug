require "rails_helper"

feature "DELETE:" do
  scenario "DESTROY: movies#destroy removes a row from the table", points: 1 do
    movie = FactoryGirl.create(:movie)
    starting_movie_count = Movie.count

    visit "/movies"
    all('.btn-danger').last.click

    final_movie_count = Movie.count
    does_movie_still_exist = Movie.exists?(movie.id)
    expect(starting_movie_count - 1).to eq(final_movie_count)
    expect(does_movie_still_exist).to eq(false)
  end
end
