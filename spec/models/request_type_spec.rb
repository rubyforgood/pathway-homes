require 'rails_helper'

RSpec.describe RequestType, :type => :model do
  it { should validate_presence_of(:category)}
  it { should validate_presence_of(:request)}
  it { should validate_uniqueness_of(:request).scoped_to(:category) }
end
