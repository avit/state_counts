require_relative 'lib/country'
require_relative 'lib/state'

# name, iso, iso3, fips
COUNTRIES = [
  CA = Country.new("Canada",         "CA",  "CAN",  "CA"),
  US = Country.new("United States",  "US",  "USA",  "US"),
  AU = Country.new("Australia",      "AU",  "AUS",  "AS")
]

# name, iso, fips, country
STATES = [
  CA_BC = State.new("British Columbia",   "BC",  nil,      CA),
  CA_ON = State.new("Ontario",            "ON",  nil,      CA),
  CA_QC = State.new("Quebec",             "QC",  nil,      CA),
  US_OR = State.new("Oregon",             nil,   "US.OR",  US),
  US_WA = State.new("Washington",         nil,   "US.WA",  US),
  US_CA = State.new("California",         nil,   "US.CA",  US),
  AU_WA = State.new("Western Australia",  "WA",  nil,      AU)
]
