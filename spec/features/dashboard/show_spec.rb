require 'rails_helper'

describe 'User dashboard show page' do
  it "shows both public and private repos" do
    stub_omniauth
    visit root_path
    click_link 'Log in with GitHub'
    expect(page).to have_content('View All Repos')
    click_link 'View All Repos'
    expect(current_path).to eq(repos_path)

    expect(page).to have_css('.public-repos')
    public_repos = find('.public-repos').text
    expect(public_repos).to_not be_empty

    expect(page).to have_css('.private-repos')
    private_repos = find('.private-repos').text
    expect(private_repos).to_not be_empty
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      uid: '65981543',
      info: {
        nickname: 'carson-jardine'
      },
      credentials: {
        token: ENV['MY_TOKEN']
      }
      })
  end
end
