require 'rails_helper'

describe ZacksInDenver, type: :model do
  it 'returns all Zacks in Denver' do
    VCR.use_cassette('zacks_in_denver') do
      user = User.new(oauth_token: ENV['oauth_token'],
                      username: "kbs5280")
      zacks = ZacksInDenver.all_by(user)
      zack = zacks.first

      expect(zack.name.class).to eq(String)
      expect(zack.image.class).to eq(String)
    end
  end
end
