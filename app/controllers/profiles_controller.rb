class ProfilesController < ApplicationController
  def show
    @profile = ProfileFacade.new(current_user)
  end
end
