# Ruby Challenge: State Counts

## Goal

You are given an array of struct-like records with these attributes:

* `state` The name or short abbreviation of a state/province
* `country` The name or short abbreviation of a country
* `count` A number representing some data for this location

The input strings representing the state and country are ill-defined. But, we
have a master list of states and countries that we want to match them to. 

For convenience you are given some defined constants for the master data like
`CA_BC` (BC, Canada) or `US_CA` (California, USA) with these attributes:

* `name` Full name like "British Columbia"
* `iso` A 2-character code like "BC"
* `fips` A state-country code like "BC.CA"
* `country` A reference to a country object

The country objects have the following attributes available:

* `name` Full name like "Canada"
* `iso` A 2-character code like "CA"
* `iso3` A 3-character code like "CAN"

The goal is to match up the example input to our master data and produce a hash that looks like this:

```ruby
{
  CA_BC => 123,
  US_CA => 456,
  # ...
}
```

## Process

Run `rspec spec` and implement a solution for the failing spec. You may add
your own specs for any of your own code, but changing the example specs is
off-side. 

Example input data can be found in the specs.

Master location data is provided in `master_data.rb`
