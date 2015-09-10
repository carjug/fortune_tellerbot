class BotController < ApplicationController
  def index
    @tweet = Bot.search_hope

    @tweet_id = @tweet.id

    @tweet_string = @tweet.text
  end

  def reply
    Bot.send_reply_tweet("Seems likely", @tweet_id)
  end
end
