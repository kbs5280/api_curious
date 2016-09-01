class StarredRepos
  attr_reader :owner, :repo, :url
  def initialize(params)
    @owner = params[:owner][:login]
    @repo = params[:name]
    @url = params[:url]
  end

  def self.all_by(user)
    starred_repos = ProfilesService.new(user).starred_repos
    starred_repos.map do |starred_repo|
      StarredRepos.new(starred_repo)
    end
  end
end
