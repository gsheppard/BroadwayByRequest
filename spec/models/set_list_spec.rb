require 'spec_helper'

describe SetList do
  let(:actors) { FactoryGirl.create_list(:actor, 3) }
  let(:set_list) { FactoryGirl.create(:set_list) }

  it { should validate_presence_of :song }
  it { should belong_to :song }
  it { should validate_presence_of :performance }
  it { should belong_to :performance }
  it { should validate_uniqueness_of(:performance_id).scoped_to(:song_id) }

  it "builds a cast list from an actors_id array and returns true" do
    actor_ids = actors.map(&:id)

    expect(set_list.set_actors(actor_ids)).to be_true
  end
end
