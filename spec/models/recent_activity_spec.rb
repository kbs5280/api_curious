require 'rails_helper'

describe 'RecentActivity', type: :model do
  it 'creates event objects and assigns attributes' do
    VCR.use_cassette('recent_activity') do
      user = User.create(oauth_token: ENV['oauth_token'],
                         username: "kbs5280")
      recent_activity = RecentActivity.all_by(user)
      activity = recent_activity.first

      expect(activity.type.class).to eq(String)
      expect(activity.repo_name.class).to eq(String)
      expect(activity.repo_url).to include('https://')
    end
  end

  it 'creates a string of the required params' do
    VCR.use_cassette('recent_activity') do
      user = User.create(oauth_token: ENV['oauth_token'],
                         username: "kbs5280")
      activity_display = RecentActivity.activity_display(user)
      activity = activity_display.first

      expect(activity).to include('Type:')
      expect(activity).to include('Repo URL:')
      expect(activity).to include('Repo:')
    end
  end
end
