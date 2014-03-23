require 'spec_helper'

describe Actor do
  let(:blanks) { [nil, ''] }
  let(:actor) { FactoryGirl.create(:actor,
    first_name: 'Banana',
    last_name: 'Jefferson')
  }
  let(:actor2) { FactoryGirl.create(:actor_with_performance) }

  it { should have_valid(:first_name).when('Banana', 'Tom') }
  it { should_not have_valid(:first_name).when(*blanks) }
  it { should have_valid(:last_name).when('Banana', 'Tom') }
  it { should_not have_valid(:last_name).when(*blanks) }
  it { should have_valid(:email).when('banana@aol.com', 'pumpkin@gmail.com') }
  it { should_not have_valid(:email).when('banana.com', 'pumpkin@aol', 'taco') }
  it { should have_valid(:phone_number).when('1234567890', '0987654321', '098-765-4321', *blanks) }
  it { should_not have_valid(:phone_number).when('123', 'bubble', '1','12345678909876') }

  it "finds the full name" do
    expect(actor.full_name).to eql('Banana Jefferson')
  end

  it "finds all performances the actor was a part of" do
    expect(actor2.performances.first).to be_instance_of Performance
  end
end
