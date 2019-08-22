class Symptom < ActiveRecord::Base
  validates_presence_of :description, :admission
  belongs_to :admission
end