class School < ApplicationRecord
  belongs_to :school_district

  attr_accessor :district_name
end
