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
    RecentActivity.all_by(current_user).take(10).map do |activity|
      "Type: #{activity.type}, Repo URL: #{activity.repo_url}, Repo: #{activity.repo_name}"
    end
  end

  def received_events
    ReceivedEvents.all_by(current_user).take(10).map do |event|
      "Actor: #{event.actor}, Type: #{event.type}, Repo: #{event.repo_name}"
    end
  end
end
