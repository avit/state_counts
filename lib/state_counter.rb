class StateCounter

  attr_accessor :matched_states_only

  def initialize(finder)
    @finder = finder
  end

  def count(records)
    records.each_with_object(empty_counts) { |r, totals|
      if state = @finder.find(r.state, r.country)
        totals[state] += r.count
      end
    }
  end

  def empty_counts
    return Hash.new(0) if matched_states_only
    @finder.all.inject(Hash.new) { |counts, state|
      counts[state] = 0
      counts
    }
  end

end
