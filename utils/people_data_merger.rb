require_relative '../lib/city_abbreviation'

class PeopleDataMerger
  require 'date'
  include CityAbbreviation

  attr_reader :order

  def initialize(order)
    @order = order
  end

  DATE_FORMAT = "%-m/%-d/%Y"

  def merge(*args)
    data = []
    args.flatten.each do |obj|
      data << create_hash(obj)
    end

    data = data.sort_by { |hsh| hsh[order] }
    data.map { |hsh| [hsh[:first_name], city_name(hsh[:city]), hsh[:birthdate]].join(", ") }
  end


  private

  def create_hash(obj)
    Hash[first_name: obj['first_name'], city: obj['city'], birthdate: Date.parse(obj['birthdate']).strftime(DATE_FORMAT)]
  end
end