require 'spec_helper'
  it { should belong_to :album }
  it { should have_many :tags }
  it { should have_many(:users).through(:tags) }
end
