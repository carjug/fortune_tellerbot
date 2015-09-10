class Bot < ActiveRecord::Base

# going to need to get the twitter handle of the person who has issued the hopeful tweet as well
# Look at twitter docs for what attributes are available on the Tweet object through the Twitter gem

  def self.search_words(words)
    CLIENT.search(words, lang: "en").first.text
  end

end
