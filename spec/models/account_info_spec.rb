require 'rails_helper'

describe 'AccountInfo', type: :model do
  it 'creates an object and assigns attributes' do
    VCR.use_cassette('account_info_all_by') do
      user = User.create(oauth_token: "9c223a767aa3fc7f61ced7c5bac6b02be25953fc",
                         username: "kbs5280")
      account_info = AccountInfo.all_by(user)

      expect(account_info.name).to eq('Kris Sparks')
      expect(account_info.username).to eq('kbs5280')
    end
  end
end
