require 'spec_helper'
require_relative '../../implementation.rb'

describe "Example 3" do

  let(:example) {
    [
      double(state: "BC",               country: "Canada",        count: 5),
      double(state: "British Columbia", country: "CA",            count: 65),
      double(state: "Ontario",          country: "CA",            count: 15),
      double(state: "QC",               country: nil,             count: 25),
      double(state: "Oregon",           country: "USA",           count: 35),
      double(state: "WA",               country: "United States", count: 45),
      double(state: "CA",               country: nil,             count: 55),
      double(state: "WA",               country: "Australia",     count: 65)
    ]
  }

  it "counts states" do
    expect( state_counts(example) ).to be == {
      CA_BC => 70,
      CA_ON => 15,
      CA_QC => 25,
      US_OR => 35,
      US_WA => 45,
      US_CA => 55,
      AU_WA => 65
    }
  end

end
