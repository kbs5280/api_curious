class RecentActivity

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
end
