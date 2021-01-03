require 'rails_helper'

describe 'Repo Facade' do
  it 'returns all types of repositories' do
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

    results = RepoFacade.get_repos(type, user)
    expect(results).to be_an(Array)
    expect(results.count).to eq(30)

    repos = results.map do |result|
      result.private?
    end

    expect(repos).to include(true).at_least(:once)
    expect(repos).to include(false).at_least(:once)

  end
  it 'returns only public repositories' do
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
    type = 'public'

    results = RepoFacade.get_repos(type, user)
    expect(results).to be_an(Array)
    expect(results.count).to eq(30)

    repos = results.map do |result|
      result.private?
    end

    expect(repos).to_not include(true)
    expect(repos).to include(false)
  end
  it 'returns only private repositories' do
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
    type = 'private'

    results = RepoFacade.get_repos(type, user)
    expect(results).to be_an(Array)
    expect(results.count).to eq(3)

    repos = results.map do |result|
      result.private?
    end

    expect(repos).to include(true)
    expect(repos).to_not include(false)
  end
end
