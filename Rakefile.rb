# # require 'cucumber/rake/task'
# # require 'rails'
#
#
#
def run_rake_task(name)
  # begin
  puts"name:#{name}"
    puts'I am under rake tasks file'
    Rake::Task[name].invoke
  # rescue Exception => e
  #   return false
  # end
  true
end

namespace :file_creation do
  Cucumber::Rake::Task.new(:rerun, 'Rerun failed cucumber tests') do |t|
    unless File.exist?(File.join(Rails.root, 'log/rerun.txt'))
      File.open(File.join(Rails.root, 'log/rerun.txt'), 'w+').close
      t.profile = 'rerun'
    end
    puts'I am under failure file creation'
  end
end

namespace :cucumber do

  desc 'Run selenium and rerun failed tests'
  task :selenium_with_retry do
    selenium_successful = run_rake_task(cucumber:default)
    rerun_successful = true
    unless selenium_successful
      rerun_successful = run_rake_task(cucumber:rerun)
    end
    unless selenium_successful || rerun_successful
      raise CucumberFailure.new 'Cucumber tests failed'
    end
  end

end



# require 'cucumber'
# require 'cucumber/rake/task'
#
# Cucumber::Rake::Task.new(:rerun, 'Rerun failed cucumber tests') do |t|
#   unless File.exist?(File.join(Rails.root, 'log/rerun.txt'))
#     File.open(File.join(Rails.root, 'log/rerun.txt'), 'w+').close
#     t.profile = 'rerun'
#   end
#   puts'I am under failure file creation'
# end
#
# namespace :features do
#   Cucumber::Rake::Task.new(:first) do |t|
#     t.profile = 'first'
#   end
#
#   Cucumber::Rake::Task.new(:rerun) do |t|
#     t.profile = 'rerun'
#   end
#
#   task :ci => [:first, :rerun]
# end
#
# task :default => "features:ci"
#
#
#
#
# require 'rubygems'
# require 'cucumber'
# require 'cucumber/rake/task'
#
# namespace :features do
#   Cucumber::Rake::Task.new(:non_js) do |t|
#     t.profile = "webrat"
#   end
#
#   Cucumber::Rake::Task.new(:selenium) do |t|
#     t.profile = "selenium"
#   end
# end


# namespace :cucumber do
  # desc 'Run selenium and rerun failed tests'
  # task :selenium_with_retry do
  #   selenium_successful = run_rake_task('cucumber:default')
  #   rerun_successful = true
  #   unless selenium_successful
  #     rerun_successful = run_rake_task('cucumber:rerun')
  #   end
  #   unless selenium_successful || rerun_successful
  #     raise CucumberFailure.new 'Cucumber tests failed'
  #   end
  # end
# end


# task :test => [ :cleanup, :parallel_run, :rerun  ]

# Rake::Task["selenium_with_retry"].invoke()
