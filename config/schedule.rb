set :output, {:standard => 'cron.log'}

set :environment,'development'

every 2.minutes do
  rake "bot:run_bot"
end

