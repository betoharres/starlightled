json.array!(@firmwares) do |firmware|
  json.extract! firmware, :id, :filename, :content_type, :file_content, :checksum
  json.url firmware_url(firmware, format: :json)
end
