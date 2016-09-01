class RecentActivity
  attr_reader :type, :repo_name, :repo_url

  def initialize(params)
    @type       = params[:type]
    @repo_name  = params[:repo][:name]
    @repo_url   = params[:repo][:url]
  end

  def self.all_by(user)
    recent_activity = ProfilesService.new(user).recent_activity
    recent_activity.map do |activity|
      RecentActivity.new(activity)
    end
  end

  def self.activity_display(user)
    all_by(user).take(10).map do |activity|
      "Type: #{activity.type}, Repo URL: #{activity.repo_url}, Repo: #{activity.repo_name}"
    end
  end
end
