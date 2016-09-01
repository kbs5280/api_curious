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

  def self.events_display(user)
    all_by(user).take(10).map do |event|
      "Actor: #{event.actor}, Type: #{event.type}, Repo: #{event.repo_name}"
    end
  end
end
