require 'spec_helper'

describe Cast do
  it { should belong_to :set_list }
  it { should belong_to :actor }
  it { should validate_presence_of :set_list }
  it { should validate_presence_of :actor }
  it { should validate_uniqueness_of(:set_list_id).scoped_to(:actor_id) }
end
