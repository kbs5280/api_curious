class AccountInfo
  attr_reader :username, :image_url, :name, :followers, :following

  def initialize(params)
    @username   = params[:login]
    @image_url  = params[:avatar_url]
    @name       = params[:name]
    @followers  = params[:followers]
    @following  = params[:following]
  end

  def self.all_by(user)
    account_info = ProfilesService.new(user).account_info
    AccountInfo.new(account_info)
  end
end
