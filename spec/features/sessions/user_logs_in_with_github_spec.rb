require 'rails_helper'

describe 'User logs in' do
  before :each do
    OmniAuth.config.mock_auth[:github] = nil
  end
  it "using github oauth2" do
    stub_omniauth
    visit root_path
    expect(page).to have_http_status(200)
    expect(page).to have_link('Log in with GitHub')
    expect(page).to_not have_link('Logout')

    click_link 'Log in with GitHub'
    expect(current_path).to eq(root_path)
    expect(page).to have_link('Logout')
    expect(page).to have_link('View All Repos')
    expect(page).to_not have_link('Log in with GitHub')
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      uid: '12345678',
      info: {
        nickname: 'carson-jardine'
      },
      credentials: {
        token: 'abcdef12345678'
      }
      })
  end
end
