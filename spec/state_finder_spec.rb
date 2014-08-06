require 'spec_helper'
require 'pry'
require_relative '../lib/state_finder'

describe "matching states" do

  let(:finder) { StateFinder.new(STATES) }
  subject { finder.find(input.name, input.country) }

  context "for an unmatched state" do
    let(:input) { OpenStruct.new(name: "XX", country: "Xanadu", count: 5) }
    it { should be nil }
  end

  context "for Canada" do
    context "state: ISO, country: NAME" do
      let(:input) { OpenStruct.new(name: "BC", country: "Canada", count: 5) }
      it { should be CA_BC }
    end

    context "state: NAME, country: ISO" do
      let(:input) { OpenStruct.new(name: "Ontario", country: "CA", count: 15) }
      it { should be CA_ON }
    end

    context "state: ISO, country: nil" do
      let(:input) { OpenStruct.new(name: "QC", country: nil, count: 25) }
      it { should be CA_QC }
    end
  end

  context "For USA" do
    context "state: NAME, country: ISO" do
      let(:input) { OpenStruct.new(name: "Oregon", country: "US", count: 35) }
      it { should be US_OR }
    end

    context "state: ISO, country: NAME" do
      let(:input) { OpenStruct.new(name: "WA", country: "United States", count: 45) }
      it { should be US_WA }
    end

    context "state: ISO, country: nil" do
      let(:input) { OpenStruct.new(name: "CA", country: nil, count: 55) }
      it { should be US_CA }
    end
  end

end
