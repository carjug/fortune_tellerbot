class Bot < ActiveRecord::Base
  # Need to write a check so bot does not reply to a single tweet more than once.

  def self.find_and_reply()
    @followers = []

    CLIENT.followers.collect do |f|
      follower = []
      @user = CLIENT.user(f)
      @tweet = @user.tweet


      if @tweet.include?("I am hopeful")
        CLIENT.update(
          Bot.send_reply_tweet(@user.screen_name),
          in_reply_to_status_id: @tweet.id
          )
      end

      Tweet.create(tweet_id: @tweet.id)

      follower.push(@user.screen_name)
      follower.push(@user.id.to_s)
      @followers.push(follower)
    end
    Bot.create_followers(@followers)
  end

  def self.send_reply_tweet(name)
    "@" + name + " " + Response.order_by_rand.first.tweet
  end

  def self.create_followers(collection)
    collection.each do |follower|
      Follower.find_or_create_by(name: follower[0], tweet_id: follower[1])
    end
  end
end
