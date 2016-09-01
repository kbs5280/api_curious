class ProfilesService
  def initialize(user)
    @_user = user
    @_connection = Faraday.new("https://api.github.com")
    @_connection.headers["Authorization"] = "token #{user.oauth_token}"
  end

  def account_info
    response = connection.get("users/#{user.username}")
    parse(response.body)
  end

  def starred_repos
    response = connection.get("/users/#{user.username}/starred")
    parse(response.body)
  end

  def recent_activity
    response = connection.get("/users/#{user.username}/events")
    parse(response.body)
  end

  def received_events
    response = connection.get("/users/#{user.username}/received_events")
    parse(response.body)
  end

  def zacks_in_denver
    response = connection.get("/search/users", { q: 'zack', location: 'denver' })
    parse(response.body)
  end

  private
    def parse(response_body)
      JSON.parse(response_body, symbolize_names: true)
    end

    def user
      @_user
    end

    def connection
      @_connection
    end
end
