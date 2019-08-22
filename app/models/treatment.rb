class Treatment < ActiveRecord::Base
  validates_presence_of :description, :necessity, :admission
  belongs_to :admission
end