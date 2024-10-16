require 'http'
require 'json'
require 'dotenv'
require 'pry'

Dotenv.load

api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/completions"

headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}

data = {
  "prompt" => "5 parfums de glace",
  "max_tokens" => 100,
  "temperature" => 0.7,
  "model" => "babbage-002"
}

response = HTTP.post(url, headers: headers, body: data.to_json)

response_body = JSON.parse(response.body.to_s)
puts "Réponse de l'API : #{response_body.inspect}"
if  response_body['choices'] && responce_body['choice'].any?
    response_string = response_body['choices'][0]['text'].strip

puts "Voici 5 parfums de glace :"
puts response_string
else
    puts "Aucune réponse trouvée dans 'choices'."
end