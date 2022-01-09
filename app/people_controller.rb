require_relative '../utils/file_reader'
require_relative '../utils/people_data_merger'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    PeopleDataMerger.new(params[:order])
                    .merge(FileReader.new(params[:dollar_format], '$').format,
                           FileReader.new(params[:percent_format], '%').format)
  end

  private

  attr_reader :params
end
