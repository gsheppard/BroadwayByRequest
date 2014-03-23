require 'spec_helper'

describe Cast do
  it { should belong_to :set_list }
  it { should belong_to :actor }
  it { should validate_presence_of :set_list }
  it { should validate_presence_of :actor }

  it "should validate the uniqueness of actors to set list" do
    casting = FactoryGirl.create(:cast)
    casting2 = FactoryGirl.build(:cast,
      actor: casting.actor,
      set_list: casting.set_list)
    expect(casting2).to_not be_valid
  end
end
