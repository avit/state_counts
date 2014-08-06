require_relative 'master_data'
require_relative 'lib/state_counter'
require_relative 'lib/state_finder'

def state_counts(data)
  finder = StateFinder.new(STATES)
  StateCounter.new(finder).count(data)
end
