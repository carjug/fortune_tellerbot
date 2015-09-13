class Bot < ActiveRecord::Base
# Should write a method that sends out a tweet when the bot is bored because no one is tweeting hopeful things.

  def self.find_and_reply()
    CLIENT.followers.collect do |f|
      @user   = CLIENT.user(f)
      @tweet  = @user.tweet

      Bot.check_for_existing_tweet(@tweet.id.to_s)

      if @tweet.text.include?("I am hopeful") && @nonexistant_tweets == 0
        CLIENT.update(
          Bot.send_reply_tweet(@user.screen_name),
          in_reply_to_status_id: @tweet.id
          )
        Tweet.create(
          tweet_id: @tweet.id,
          follower_id: @user.id.to_s
          )
      end
    end
  end

  def self.check_for_existing_tweet(current_tweet_id)
    @tweets = Tweet.all
    @nonexistant_tweets = 0

    @tweets.each do |tweet|
      if tweet.tweet_id == current_tweet_id
        @nonexistant_tweets += 1
      end
    end
    return @nonexistant_tweets
  end

  def self.send_reply_tweet(name)
    "@" + name + " " + Response.order_by_rand.first.tweet
  end
end
