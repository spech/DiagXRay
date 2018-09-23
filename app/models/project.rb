class Project < ApplicationRecord
  validates_presence_of :name, :created_by
  validates_uniqueness_of :name
end
