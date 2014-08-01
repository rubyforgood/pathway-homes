require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of(:role)}

  describe 'password expiration' do
    it 'by default, password is expired' do
      user = create(:user, :admin)
      user.password_updated_at = Time.at(0)

      expect(user.password_expired?).to be_truthy
    end

    it 'resets the password expiration time when the password is updated' do
      user = create(:user, :admin)

      user.update_attributes!(password: "abcd1234", password_confirmation: "abcd1234")
      expect(user.password_expired?).to be_falsey
    end
  end
end
