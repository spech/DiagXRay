require 'rails_helper'

RSpec.describe Project, type: :model do
  # Association test
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:created_by) }
end
