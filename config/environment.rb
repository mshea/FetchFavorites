# Load the rails application
require File.expand_path('../application', __FILE__)
require 'open-uri'
require 'csv'
require 'time'
#require 'twitter'
# Initialize the rails application
FetchFavorites::Application.initialize!
