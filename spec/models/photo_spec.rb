require 'spec_helper'
describe Photo do
  it { should validate_presence_of :picture_file_name }
  it { should belong_to :album }
  it { should have_many :tags }
  it { should have_many(:users).through(:tags) }
end
