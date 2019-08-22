class Medication < ActiveRecord::Base
  self.table_name = 'medication_orders'
  validates_presence_of :admission, :order_frequency, :name, :dosage, :necessity
  belongs_to :order_frequency
  belongs_to :admission
  enum route: {'PO' => 0, 'IM' => 1, 'SC' => 2}
  enum unit: {mg: 0}
end