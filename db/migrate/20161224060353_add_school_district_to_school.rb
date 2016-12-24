class AddSchoolDistrictToSchool < ActiveRecord::Migration[5.0]
  def change
    add_reference :schools, :school_district, foreign_key: true
  end
end
