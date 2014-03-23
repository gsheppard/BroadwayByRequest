require 'spec_helper'

describe Song do
  let(:blanks) { [nil, ''] }
  it { should belong_to :musical }
  it { should have_many(:performances).through(:set_lists) }
  it { should have_many :set_lists }

  it { should validate_presence_of :musical }
  it { should have_valid(:name).when('Name', 'Maria') }
  it { should_not have_valid(:name).when(*blanks) }
end
