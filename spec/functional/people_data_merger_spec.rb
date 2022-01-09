require 'spec_helper'

RSpec.describe 'People Data Merger' do

  let(:dollar_file_data) { File.read('spec/fixtures/people_by_dollar.txt') }
  let(:percent_file_data) { File.read('spec/fixtures/people_by_percent.txt') }
  let(:dollar_splitter) { '$' }
  let(:percent_splitter) { '%' }
  let(:dollar_format_data) { FileReader.new(dollar_file_data, dollar_splitter).format }
  let(:percent_format_data) { FileReader.new(percent_file_data, percent_splitter).format }
  let(:order) { :first_name }

  describe "people data merger to get an order and merge 'people_by_dollar.txt' file data into desirable format" do
    it 'sort and format data into array of strings' do
      data = PeopleDataMerger.new(order).merge(dollar_format_data)
      expect(data).is_a?(Array)
      expect(data.size).to eq 2
      expect(data.first).is_a?(String)
      expect(data).to eq ['Rhiannon, Los Angeles, 4/30/1974',
                          'Rigoberto, New York City, 1/5/1962']
    end
  end

  describe "people data merger to get an order and merge 'people_by_percent.txt' file data into desirable format" do
    it 'sort and format data into array of strings' do
      data = PeopleDataMerger.new(order).merge(percent_format_data)
      expect(data).is_a?(Array)
      expect(data.size).to eq 2
      expect(data.first).is_a?(String)
      expect(data).to eq ['Elliot, New York City, 5/4/1947',
                          'Mckayla, Atlanta, 5/29/1986']
    end
  end

  describe "people data merger to get an order and merge 'people_by_dollar.txt' and 'people_by_percent.txt' files data into desirable format" do
    it 'sort and format data into array of strings' do
      data = PeopleDataMerger.new(order).merge(dollar_format_data, percent_format_data)
      puts data
      expect(data).is_a?(Array)
      expect(data.size).to eq 4
      expect(data.first).is_a?(String)
      expect(data).to eq ['Elliot, New York City, 5/4/1947',
                          'Mckayla, Atlanta, 5/29/1986',
                          'Rhiannon, Los Angeles, 4/30/1974',
                          'Rigoberto, New York City, 1/5/1962']
    end
  end
end
