require 'http'
require 'json'
require 'dotenv'
Dotenv.load

api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/models"

headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}



reponse = HTTP.get("https://api.openai.com/v1/models", headers: headers)
puts reponse