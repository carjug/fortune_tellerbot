require 'rails_helper'

RSpec.describe Bot, type: :model do

  context "#create_twitter_posts" do
    it "returns of list of followers from the API" do
      VCR.use_cassette('get followers of bot') do

        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV['TWITTER_KEY']
          config.consumer_secret     = ENV['TWITTER_SECRET']
          config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
          config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
        end
        @followers = []

        client.followers.collect do |f|
          user = client.user(f)
          @followers.push(user)
        end

        expect(@followers.count).to eq 7
      end
    end
  end
end
