class OrderFrequency < ActiveRecord::Base
  enum unit: {hr: 0}
end