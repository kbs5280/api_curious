class ProfilesService
  def initialize
    @connection = Faraday.new("https://api.github.com")
  end

  def profile_setup(user)
    @connection.headers["Authorization"] = "token #{user.oauth_token}"
  end

  def account_info(user)
    response = @connection.get("users/#{user.username}")
    parse(response.body)
  end

  def starred_repos(user)
    response = @connection.get("/users/#{user.username}/starred")
    parse(response.body)
  end

  def recent_activity(user)
    response = @connection.get("/users/#{user.username}/events")
    parse(response.body)
  end

  def received_events(user)
    response = @connection.get("/users/#{user.username}/received_events")
    parse(response.body)
  end

  private
    def parse(response_body)
      JSON.parse(response_body, symbolize_names: true)
    end
end
