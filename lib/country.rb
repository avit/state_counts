Country = Struct.new(:name, :iso, :iso3, :fips) do
  def inspect
    "<#{iso}>"
  end
end
