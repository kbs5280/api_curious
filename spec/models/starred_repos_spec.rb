require 'rails_helper'

describe 'StarredRepos', type: :model do
  it 'creates objects and returns attributes' do
     VCR.use_cassette('starred_repos') do
       user = User.create(oauth_token: ENV['oauth_token'],
                          username: "kbs5280")
      starred_repos = StarredRepos.all_by(user)
      starred_repo = starred_repos.first

      expect(starred_repo.owner.class).to eq(String)
      expect(starred_repo.repo.class).to eq(String)
      expect(starred_repo.url).to include('https://')
    end
  end
end
