set :output, {:standard => 'cron.log'}

set :environment,'development'

every 15.minutes do
  rake "bot:run_bot"
end

