require "bundler/gem_tasks"
require 'rspec/core/rake_task'

desc 'Build graph_parser from treetop grammar'
task :build_graph_parser do
  system 'bundle exec tt -f lib/ppp/constraint/parser/graph_parser.treetop'
end

RSpec::Core::RakeTask.new(:spec)

task :default => [ :build_graph_parser, :spec ]
