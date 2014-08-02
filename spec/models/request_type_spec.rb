require 'rails_helper'

RSpec.describe RequestType, :type => :model do
  it { should validate_presence_of(:category)}
  it { should validate_presence_of(:request)}
  it { should validate_uniqueness_of(:request).scoped_to(:category) }

  describe '#full' do
    it 'should format the responce category adn type' do
      request_type = RequestType.new(category: 'fire', request: 'small')

      expect(request_type.full).to eq 'fire:small'
    end
  end
end
