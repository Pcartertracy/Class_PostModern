json.array!(@sound_bites) do |sound_bite|
  json.extract! sound_bite, :id, :title, :transcript, :lengh, :audiofile
  json.url sound_bite_url(sound_bite, format: :json)
end
