require 'spec_helper'

describe Performance do
  let!(:performance) { FactoryGirl.create(:performance, date: '2012-01-04 13:55:00') }
  let!(:song) { FactoryGirl.create(:song) }
  let!(:set_list) { FactoryGirl.create(:set_list,
    performance: performance,
    song: song)
  }
  let!(:actor) { FactoryGirl.create(:actor) }
  let!(:cast) { FactoryGirl.create(:cast,
    set_list: set_list,
    actor: actor)
  }

  it { should have_many :set_lists }
  it { should have_many(:songs).through(:set_lists) }
  it { should have_valid(:date).when('2012-01-01 9:30:21', Time.now) }
  it { should_not have_valid(:date).when(4) }
  it { should have_valid(:location).when('Boston', 'Here') }

  it "should clean up the date to not show have the timezone" do
    expect(performance.clean_time).to eql('01/04/2014 01:55PM') #change this if you need to but you can make this pass
  end

  it "finds the set list based on the song" do
    expect(performance.find_set_list(song)).to eq(song)
  end

  it "finds the actors who sang a song at a performance" do
    expect(performance.song_actors(song)).to eq(actor)
  end

  it "makes an array of set lists and returns true from an array of song_ids" do
    song2 = FactoryGirl.create(:song, musical: song.musical)
    song_id_array = [song.id, song2.id]
    expect(performance.song_builder(song_id_array)).to be_true
  end

  it "finds the singing actors of a play" do
    actor2 = FactoryGirl.create(:actor)
    cast2 = FactoryGirl.create(:cast,
      actor: actor2,
      set_list: set_list)

    expect(performance.singing_actors.first).to be_instance_of Actor
    expect(performance.singing_actors.last).to be_instance_of Actor
  end
end
