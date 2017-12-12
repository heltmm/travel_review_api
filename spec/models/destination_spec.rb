require 'rails_helper'

describe Destination, 'validation' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :country }
  it { should validate_presence_of :city }
end


describe Destination, 'association' do
  it { should have_many :reviews }
end

describe Destination, 'column_specification' do
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:country).of_type(:string) }
  it { should have_db_column(:city).of_type(:string) }
  it { should have_db_column(:price).of_type(:decimal) }
  it { should have_db_column(:category).of_type(:string) }
  it { should have_db_column(:accommodations).of_type(:string) }
end
