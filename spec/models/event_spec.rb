require 'rails_helper'

RSpec.describe Event do
  before do
   @event_category= create :event_category
    @event= create :event, @event_category
  end
  subject{@event}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_uniqueness_of(:event_date) }
  it { should validate_uniqueness_of(:fees) }
  it  { should have_and_belong_to_many(:users) }
  it { should belongs_to(:event_category) }
end
