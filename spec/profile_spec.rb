require 'stackprof'
require 'rspec/core'

GC.disable 
profile = StackProf.run(raw: true) do
  RSpec::Core::Runner::run(['spec/solution_spec.rb'], $stderr, $stdout)
end

require 'json'

File.open("profile.json", 'w') { |f| f.puts(JSON.dump(profile)) }