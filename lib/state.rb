State = Struct.new(:name, :iso, :fips, :country) do
  def inspect
    "<#{country.iso}.#{iso || fips.split(".").last}>"
  end
end
