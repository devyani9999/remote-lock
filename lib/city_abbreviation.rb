module CityAbbreviation

  CITY_ABBR = {
    'NYC' => 'New York City',
    'LA' => 'Los Angeles'
  }

  def city_name(name)
    CITY_ABBR.has_key?(name) ? CITY_ABBR[name] : name
  end
end
