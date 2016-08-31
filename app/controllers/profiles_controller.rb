class ProfilesController < ApplicationController
  def show
    @profile = Profiles.find(current_user)
    @starred_repos = Profiles.starred_repos(current_user)
    @recent_activity = Profiles.recent_activity(current_user)
    @received_events = Profiles.received_events(current_user)
  end
end
