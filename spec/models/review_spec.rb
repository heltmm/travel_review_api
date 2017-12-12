require 'rails_helper'

describe Review, 'validation' do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }
  it { should validate_inclusion_of(:rating).in_range(1..5) }
end


describe Review, 'association' do
  it { should belong_to :destination }
end

describe Review, 'column_specification' do
  it { should have_db_column(:author).of_type(:string) }
  it { should have_db_column(:content).of_type(:text) }
  it { should have_db_column(:rating).of_type(:integer) }


end
