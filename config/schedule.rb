# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, {:standard => 'cron.log'}
# job_type :rake, "cd /Users/cajugler/ada/project_forks/fortune_tellerbot && RAILS_ENV=production bundle exec rake bot:run_bot --silent"
#
every '*/2 * * * *' do
  # command "/usr/bin/some_great_command"
  # runner "Bot.find_and_reply"
  rake "bot:run_bot"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
