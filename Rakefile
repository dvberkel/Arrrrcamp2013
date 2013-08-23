require "bundler/gem_tasks"
require 'rspec/core/rake_task'

desc 'Build whitespace_parser from treetop grammar'
task :build_whitespace_parser do
  system 'bundle exec tt -f lib/ppp/constraint/parser/whitespace_parser.treetop'
end

desc 'Build graph_parser from treetop grammar'
task :build_graph_parser do
  system 'bundle exec tt -f lib/ppp/constraint/parser/graph_parser.treetop'
end

desc 'Build all parsers'
task :build_all_parsers => [ :build_whitespace_parser, :build_graph_parser ]

RSpec::Core::RakeTask.new(:spec)

task :default => [ :build_all_parsers, :spec ]
