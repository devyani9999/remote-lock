require 'spec_helper'

RSpec.describe 'File Reader' do
  describe "file reader to read 'people_by_dollar.txt' and split and format data as a hash map with header" do

    let(:file_data) { File.read('spec/fixtures/people_by_dollar.txt') }
    let(:splitter) { '$' }
    let(:file_reader) { FileReader.new(file_data, splitter) }

    it 'parses and format input file and outputs data in a hash map' do
      format_data = file_reader.format
      expect(format_data).is_a?(Array)
      expect(format_data.first).is_a?(Hash)
      expect(format_data.first).to have_key('birthdate')
      expect(format_data.first).to have_key('city')
      expect(format_data.first).to have_key('first_name')
      expect(format_data.first).to have_key('last_name')
      expect(format_data).to eq [{ "birthdate" => "30-4-1974", "city" => "LA", "first_name" => "Rhiannon", "last_name" => "Nolan" },
                                 { "birthdate" => "5-1-1962", "city" => "NYC", "first_name" => "Rigoberto", "last_name" => "Bruen" }]
    end
  end

  describe "file reader to read 'people_by_percent.txt' and split and format data as a hash map with header" do

    let(:file_data) { File.read('spec/fixtures/people_by_percent.txt') }
    let(:splitter) { '%' }
    let(:file_reader) { FileReader.new(file_data, splitter) }

    it 'parses and format input file and outputs data in a hash map' do
      format_data = file_reader.format
      expect(format_data).is_a?(Array)
      expect(format_data.first).is_a?(Hash)
      expect(format_data.first).to have_key('birthdate')
      expect(format_data.first).to have_key('city')
      expect(format_data.first).to have_key('first_name')
      expect(format_data).to eq [{ "first_name" => "Mckayla", "city" => "Atlanta", "birthdate" => "1986-05-29" },
                                 { "first_name" => "Elliot", "city" => "New York City", "birthdate" => "1947-05-04" }]
    end
  end
end
