require 'rails_helper'

RSpec.describe Bot, type: :model do
  context "#create_twitter_posts" do
    before :each do
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
      end
      Tweet.create(tweet_id: "1")
      Response.create(tweet: "Don't count on it")
    end

    it "returns of list of followers from the API" do
      VCR.use_cassette('get followers of bot') do
        followers = []
        @client.followers.collect do |f|
          user = @client.user(f)
          followers.push(user)
        end

        expect(followers.count).to eq 7
      end
    end

    it "knows about existing tweets" do
      @tweets = Tweet.all

      expect(@tweets.count). to eq 1
    end

    it "generates a response" do
      bot = Bot.create(id: 1)

      bot.find_and_reply

      expect(Response.first).to eq "Don't count on it"
    end
  end
end
