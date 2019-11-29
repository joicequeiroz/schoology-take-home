require "csv"
require "json"

When("I have a JSON file") do
  file = File.read(File.absolute_path("./fixtures/input_data.json"))
  data_hash1 = JSON.parse(file)
  @data_hash2 = []
  data_hash1.each do |key, value|
    @data_hash2 << value
  end
end

When("I want to convert from JSON into CSV") do
  total = @data_hash2.size
  data_hash3 = @data_hash2.map { |x| x.values }
  data_hash4 = @data_hash2.map { |y| y.keys }.uniq
  CSV.open(File.absolute_path("./fixtures/myFirstFile.csv"), "wb", { col_sep: "," }) do |csv|
    csv << data_hash4[0]
    total.times do |nm|
      csv << data_hash3[nm]
    end
  end
end

Then("I should see my file saved as CSV") do
  filename = File.absolute_path("./fixtures/myFirstFile.csv")
  File.exist?(filename)
end
