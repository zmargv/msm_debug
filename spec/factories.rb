# spec/factories/articles.rb
FactoryGirl.define do
  factory :movie do
    title "The Godfather: Part VI"
    year 2016
    duration 180
    description "Not a real movie"
    image_url "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Lake_Bondhus_Norway_2862.jpg/1280px-Lake_Bondhus_Norway_2862.jpg"
    director_id 1
  end

  factory :director do
    dob "January 1, 1970"
    name "Someone"
    bio "Someone's background"
    image_url "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Lake_Bondhus_Norway_2862.jpg/1280px-Lake_Bondhus_Norway_2862.jpg"
  end

  factory :actor do
    dob "January 1, 1970"
    name "Someone"
    bio "Someone's background"
    image_url "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Lake_Bondhus_Norway_2862.jpg/1280px-Lake_Bondhus_Norway_2862.jpg"
  end

  factory :role do
    character_name "Superman"
    movie_id 1
    actor_id 1
  end
end
