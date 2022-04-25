module Format
  def format(response)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
