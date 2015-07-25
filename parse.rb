require 'json'

class DataPick
  def create_path
    pre_relative = Dir.glob("./*.json")
    relative = pre_relative.to_s.gsub('"', "").gsub("[", "").gsub("]", "")
    json_data_path = File.expand_path(relative)
  end
end

class JsonHandler
  def initialize
    @json_data = ""
    @json_data_path = DataPick.new.create_path
  end

  def open_json
    #created_json_path = DataPick.new.create_path
    if @json_data_path#created_json_path
      @json_data = open(@json_data_path) do |file|
        JSON.load(file)
      end
    else
      raise "Cannnot find such file!"
    end
  end

  def update_json
    @json_data["age"] = 1000
  end


  def save_json
    open(@json_data_path, 'w') do |file|
     JSON.dump(@json_data, file)
    end
  end
end

json_handler = JsonHandler.new

json_handler.open_json
json_handler.update_json
json_handler.save_json



