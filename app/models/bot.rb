class Bot < ActiveRecord::Base
# going to need to get the twitter handle of the person who has issued the hopeful tweet as well
# Look at twitter docs for what attributes are available on the Tweet object through the Twitter gem

  def self.find_or_create_followers()
    @followers = []

    CLIENT.followers.collect do |f|
      follower = []
      @user = CLIENT.user(f)
      @tweet = @user.tweet.text
      if @tweet.include?("I am hopeful")
        CLIENT.update(Bot.send_reply_tweet(@user.screen_name), in_reply_to_status_id: @user.id.to_s)
      end

      follower.push(@user.screen_name)
      follower.push(@user.id.to_s)
      @followers.push(follower)
    end

    @followers.each do |follower|
      Follower.find_or_create_by(name: follower[0], tweet_id: follower[1])
    end
  end

  def self.send_reply_tweet(name)
    "@" + name + " " + Response.order_by_rand.first.tweet
  end

end
