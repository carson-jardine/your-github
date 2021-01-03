require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
      uid: '12345678',
      info: {
        nickname: 'carson-jardine'
      },
      credentials: {
        token: 'abcdef12345678'
      }
    }
    user =  User.from_omniauth(auth)

    expect(user.uid).to eq('12345678')
    expect(user.username).to eq('carson-jardine')
    expect(user.token).to eq('abcdef12345678')
  end
end
