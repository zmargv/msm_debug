require "rails_helper"

feature "DELETE:" do
  scenario "DESTROY: directors#destroy removes a row from the table", points: 1 do
    director = FactoryGirl.create(:director)
    starting_director_count = Director.count

    visit "/directors"
    all('.btn-danger').last.click

    final_director_count = Director.count
    does_director_still_exist = Director.exists?(director.id)
    expect(starting_director_count - 1).to eq(final_director_count)
    expect(does_director_still_exist).to eq(false)
  end
end
