require 'rails_helper'

describe 'ReceivedEvents', type: :model do
  it 'creates event objects and assigns attributes' do
    VCR.use_cassette('received_events') do
      user = User.create(oauth_token: ENV['oauth_token'],
                         username: "kbs5280")
      received_events = ReceivedEvents.all_by(user)
      received_event = received_events.first

      expect(received_event.type.class).to eq(String)
      expect(received_event.actor.class).to eq(String)
      expect(received_event.repo_name.class).to eq(String)
    end
  end

  it 'creates a string of the required params' do
    VCR.use_cassette('received_events') do
      user = User.create(oauth_token: ENV['oauth_token'],
                         username: "kbs5280")
      events_display = ReceivedEvents.events_display(user)
      event = events_display.first

      expect(event).to include('Actor:')
      expect(event).to include('Type:')
      expect(event).to include('Repo:')
    end
  end
end
