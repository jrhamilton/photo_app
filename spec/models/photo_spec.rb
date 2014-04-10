require 'spec_helper'
describe Photo do
  it { should belong_to :album }
  it { should have_many :tags }
  it { should have_many(:users).through(:tags) }
end
