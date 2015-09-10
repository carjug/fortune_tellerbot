class Bot < ActiveRecord::Base

# going to need to get the twitter handle of the person who has issued the hopeful tweet as well
# Look at twitter docs for what attributes are available on the Tweet object through the Twitter gem

  def self.search_hope
    CLIENT.search("I hope that", lang: "en").first
  end

  def self.send_reply_tweet(tweet, id)
    CLIENT.update(tweet, in_reply_to_status_id: id)
  end

end
