class Observation < ActiveRecord::Base
  validates_presence_of :description, :moment, :admission
  belongs_to :admission
end