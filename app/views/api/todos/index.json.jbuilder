json.set! :todos do
  json.array! @todos do |todo|
    json.extract! todo, :id, :body
  end
end