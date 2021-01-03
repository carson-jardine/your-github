require 'rails_helper'

describe 'User can log out' do
  it "user successfully logs out and is redirected to home page" do
    stub_omniauth
    visit root_path
    click_link 'Log in with GitHub'
    expect(page).to have_link('Logout')
    expect(page).to_not have_link('Log in with GitHub')

    click_link 'Logout'
    expect(current_path).to eq(root_path)
    expect(page).to have_link('Log in with GitHub')
    expect(page).to_not have_link('Logout')
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
