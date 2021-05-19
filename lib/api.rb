require 'faraday'
require 'pry'
require 'json'

response = Faraday.get 'https://api.github.com/users/garet-rich'

body = response.body

binding.pry