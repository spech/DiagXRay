require 'rails_helper'

RSpec.describe Project, type: :model do
  # Association test
  # Validation tests
  # ensure columns name and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name)}
  it { should validate_presence_of(:created_by) }
  it { should_not allow_value("blah").for(:name) }
end
