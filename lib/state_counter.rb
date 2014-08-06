class StateCounter

  def initialize(finder)
    @finder = finder
  end

  def count(records)
    @finder.all.each_with_object(Hash.new) { |state, totals|
      totals[state] = extract_count_by(state, records)
    }
  end

  def extract_count_by(state, records)
    matches = []
    records.delete_if do |r|
      if state == @finder.find(r.state, r.country)
        matches << r
      end
    end
    matches.reduce(0) { |a, r| a + r.count }
  end

end
