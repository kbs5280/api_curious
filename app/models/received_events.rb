class ReceivedEvents
  attr_reader :type, :actor, :repo_name

  def initialize(params)
    @type       = params[:type]
    @actor      = params[:actor][:login]
    @repo_name  = params[:repo][:name]
  end

  def self.all_by(user)
    received_events = ProfilesService.new(user).received_events
    received_events.map do |event|
      ReceivedEvents.new(event)
    end
  end
end
