require 'rails_helper'

RSpec.describe Note, :type => :model do
  it { should validate_presence_of(:note)}
  it { should validate_presence_of(:user)}
  it { should validate_presence_of(:service_request)}
end
