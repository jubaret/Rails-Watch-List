# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

def retrieve_movies
  url = "http://tmdb.lewagon.com/movie/top_rated?"
  api_result = URI.open(url).read
  api_result = JSON.parse(api_result)
  api_result["results"].each do |movie|
    m = Movie.new
    m.title = movie["title"]
    m.overview = movie["overview"]
    m.poster_url = movie["poster_path"]
    m.rating = movie["vote_average"]
    m.save
  end
end

retrieve_movies
