require 'rails_helper'

describe ProfilesService, type: :model do
  context '#account_info' do
    it 'returns account info for a user' do
      VCR.use_cassette('profiles_service_account_info') do
        user = User.create(oauth_token: "9c223a767aa3fc7f61ced7c5bac6b02be25953fc",
                           username: "kbs5280")
        account_info = ProfilesService.new(user).account_info

        expect(account_info.count).to eq(30)
        expect(account_info[:login]).to eq('kbs5280')
        expect(account_info[:avatar_url].class).to eq(String)
        expect(account_info).to have_key(:followers)
        expect(account_info).to have_key(:following)
      end
    end
  end

  context '#starred_repos' do
    it 'returns the starred repos for a user' do
      VCR.use_cassette('profiles_service_starred_repos') do
        user = User.create(oauth_token: "9c223a767aa3fc7f61ced7c5bac6b02be25953fc",
                           username: "kbs5280")
        starred_repos = ProfilesService.new(user).starred_repos
        starred_repo = starred_repos.first

        expect(starred_repo).to have_key(:owner)
        expect(starred_repo).to have_key(:releases_url)
        expect(starred_repo).to have_key(:watchers)
        expect(starred_repo).to have_key(:stargazers_count)
      end
    end
  end

  context '#recent_activity' do
    it 'returns the recent activity for a user' do
      VCR.use_cassette('profiles_services_recent_activity') do
        user = User.create(oauth_token: "9c223a767aa3fc7f61ced7c5bac6b02be25953fc",
                           username: "kbs5280")
        recent_activity = ProfilesService.new(user).recent_activity
        activity = recent_activity.first

        expect(activity[:actor][:login]).to eq('kbs5280')
        expect(activity).to have_key(:type)
        expect(activity).to have_key(:payload)
      end
    end
  end

  context '#received_events' do
    it 'returns events for users to user follows' do
      VCR.use_cassette('service_profile_received_events') do
        user = User.create(oauth_token: "9c223a767aa3fc7f61ced7c5bac6b02be25953fc",
                           username: "kbs5280")
        received_events = ProfilesService.new(user).received_events
        received_event = received_events.first

        expect(received_event).to have_key(:actor)
        expect(received_event).to have_key(:type)
        expect(received_event).to have_key(:payload)
      end
    end
  end
end
