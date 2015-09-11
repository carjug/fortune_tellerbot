namespace :bot do
  desc "Checks follower's tweets for hopefule phrases and replies"
  task run_bot: :environment do
    Bot.find_and_reply
  end
end
