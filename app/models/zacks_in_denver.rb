class ZacksInDenver
  attr_reader :name, :image

  def initialize(params)
    @name = params[:login]
    @image = params[:avatar_url]
  end

  def self.all_by(user)
    zacks = ProfilesService.new(user).zacks_in_denver
    zacks[:items].map do |zack|
      ZacksInDenver.new(zack)
    end
  end
end
