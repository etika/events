require 'rails_helper'

RSpec.describe User , :type => :model do
  subject { create(:user, :female)}

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:password) }
  it { should validate_presence_of(:gender) }
  it{ should have_and_belong_to_many(:roles) }
  it { should have_many(:user_events) }
  it { should have_many(:events).through(:user_events) }

end
