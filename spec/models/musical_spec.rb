require 'spec_helper'

describe Musical do
  let(:blanks) { [nil, ''] }

  it { should have_many :songs }
  it { should have_valid(:name).when('West Side Story', 'Pebble') }
  it { should_not have_valid(:name).when(*blanks) }
  it { should have_valid(:year).when(1999, 2000, 2013) }
  it { should_not have_valid(:year).when(1, 20, 201) }
end
