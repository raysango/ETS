class DiagnosticProcedure < ActiveRecord::Base
  validates_presence_of :description, :moment, :admission
  belongs_to :admission
  has_many :diagnoses, as: :owner
end