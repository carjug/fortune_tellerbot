set :output, {:standard => 'cron.log'}

if Rails.env.development?
  set :environment,'development'

  every 2.minutes do
    rake "bot:run_bot"
  end
end

if Rails.env.production?
  set :environment, 'production'

  every 15.minutes do
    rake "bot:run_bot"
  end
end

