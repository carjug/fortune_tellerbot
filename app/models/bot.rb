class Bot < ActiveRecord::Base
# going to need to get the twitter handle of the person who has issued the hopeful tweet as well
# Look at twitter docs for what attributes are available on the Tweet object through the Twitter gem

  def self.find_followers()
   @screen_names = CLIENT.followers.collect do |f|
      CLIENT.user(f).screen_name
    end
    @screen_names.each do |f|
      Follower.create(name: f)
    end
  end

  def self.search_hope
    @tweet = CLIENT.search("I hope that", lang: "en").first

    @tweet_id = @tweet.id

    @tweet_string = @tweet.text
  end

  def self.send_reply_tweet(id)
    binding.pry
    CLIENT.update(Response.order_by_rand.first.tweet, in_reply_to_status_id: id)
  end

end
