require_relative '../master_data.rb'

class StateFinder

  # Takes a reference array of states from which it returns found matches
  def initialize(master_states)
    @master_states = master_states
  end

  # Based on a fuzzy name for state and country, find the reference state
  def find(fuzzy_state, fuzzy_country)
    remaining_matches = all.each_with_index.each_with_object([]) { |(master, i), best_matches|
      state_matches   = state_match?(master, fuzzy_state)
      country_matches = country_match?(master.country, fuzzy_country)

      return master if state_matches && country_matches
      best_matches << master if state_matches
    }
    resolve_ambiguous_matches(remaining_matches)
  end

  # Get the master list of all the reference states
  def all
    @master_states
  end

  private

  def state_match?(t, fuzzy_name)
    partial_match?(t, fuzzy_name, -1)
  end

  def country_match?(t, fuzzy_name)
    partial_match?(t, fuzzy_name, 0)
  end

  def partial_match?(t, fuzzy_name, fips_index)
    return false unless fuzzy_name
    return true if t.name == fuzzy_name
    return true if t.iso == fuzzy_name
    return true if t.fips && t.fips.split(".")[fips_index] == fuzzy_name
  end

  # TODO: use priority order (e.g. US.WA before AU.WA) or other heuristic to
  # decide when the country is unmatched
  def resolve_ambiguous_matches(states)
    states.first
  end
end
