class ProfileFacade
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def account_info
    AccountInfo.all_by(current_user)
  end

  def starred_repos
    StarredRepos.all_by(current_user)
  end

  def recent_activity
    RecentActivity.all_by(current_user)
  end

  def received_events
    ReceivedEvents.all_by(current_user)
  end
end
