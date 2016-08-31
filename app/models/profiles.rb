class Profiles < OpenStruct
  def self.service
    @@service ||= ProfilesService.new
  end

  def self.find(user)
    account_info = service.account_info(user)
    Profiles.new(account_info)
  end

  def self.starred_repos(user)
    starred_repos = service.starred_repos(user)
    starred_repos.map do |starred_repo|
      Profiles.new(starred_repo)
    end
  end

  def self.recent_activity(user)
    recent_activity = service.recent_activity(user)
    recent_activity.map do |activity|
      Profiles.new(activity)
    end
  end

  def self.watched_repos(user)
    watched_repos = service.watched_repos(user)
    watched_repos.map do |repo|
      Profiles.new(repo)
    end
  end

  def self.received_events(user)
    received_events = service.received_events(user)
    received_events.map do |event|
      Profiles.new(event)
    end
  end
end
