json.array!(@instructions) do |instruction|
  json.extract! instruction, :id, :game_id, :command_id
  json.url instruction_url(instruction, format: :json)
end
