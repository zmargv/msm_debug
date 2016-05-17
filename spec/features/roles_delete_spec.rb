require "rails_helper"

feature "DELETE:" do
  scenario "DESTROY: roles#destroy removes a row from the table", points: 1 do
    role = FactoryGirl.create(:role)
    starting_count = Role.count

    visit "/roles"
    all('.btn-danger').last.click

    final_count = Role.count
    does_row_still_exist = Role.exists?(role.id)
    expect(starting_count - 1).to eq(final_count)
    expect(does_row_still_exist).to eq(false)
  end
end
