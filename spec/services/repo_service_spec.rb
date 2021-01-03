require 'rails_helper'

describe RepoService do
  context 'class methods' do
    context '#repos' do
      it "returns repo data" do
        auth = {
          uid: '65981543',
          info: {
            nickname: 'carson-jardine'
          },
          credentials: {
            token: ENV['MY_TOKEN']
          }
        }
        user =  User.from_omniauth(auth)
        type = 'all'

        search = RepoService.repos(type, user)
        expect(search).to be_an Array

        repo_data = search[0]
        expect(repo_data).to be_a Hash

        expect(repo_data).to have_key(:name)
        expect(repo_data[:name]).to be_a(String)

        expect(repo_data).to have_key(:private)
        expect(repo_data[:private]).to be_a(FalseClass)

        private_repos = search.find_all do |s|
          s[:private] == true
        end
        private_repo_data = private_repos.first

        expect(private_repo_data[:private]).to be_a(TrueClass)

        expect(repo_data).to have_key(:owner)
        expect(repo_data[:owner]).to be_a(Hash)

        expect(repo_data[:owner]).to have_key(:html_url)
        expect(repo_data[:owner][:html_url]).to be_a(String)
      end
    end
  end
end
