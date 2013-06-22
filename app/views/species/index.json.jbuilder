json.array!(@species) do |species|
  json.extract! species, :name, :identification, :assimilated
  json.url species_url(species, format: :json)
end