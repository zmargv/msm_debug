class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :dob
      t.string :name
      t.text :bio
      t.string :image_url

      t.timestamps

    end
  end
end
