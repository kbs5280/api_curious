class Profiles < OpenStruct
  def self.service(user)
    @@service ||= ProfilesService.new(user)
  end

  def self.find(user)
    account_info = service(user).account_info
    Profiles.new(account_info)
  end

  def self.starred_repos(user)
    starred_repos = service(user).starred_repos
    starred_repos.map do |starred_repo|
      Profiles.new(starred_repo)
    end
  end

  def self.recent_activity(user)
    recent_activity = service(user).recent_activity
    recent_activity.map do |activity|
      Profiles.new(activity)
    end
  end

  def self.watched_repos(user)
    watched_repos = service(user).watched_repos
    watched_repos.map do |repo|
      Profiles.new(repo)
    end
  end

  def self.received_events(user)
    received_events = service(user).received_events
    received_events.map do |event|
      Profiles.new(event)
    end
  end
end
