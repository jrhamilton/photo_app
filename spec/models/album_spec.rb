require 'spec_helper'
describe Album do
  it { should have_many :photos }
  it { should belong_to :user }
  it { should validate_presence_of :name }
end
