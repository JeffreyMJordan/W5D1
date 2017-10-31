# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:kelly) do
    User.create!(username: 'Kelly', password: 'corgis')
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_uniqueness_of(:session_token) }

  it { should have_many(:goals) }
  it { should have_many(:comments) }
  it { should have_many(:cheers) }

  it "should find user by username and password" do
    User.create!(username: 'Kelly', password: 'corgis')
    expect(User.find_by_credentials('Kelly', 'corgis')).not_to be_nil
  end

end
