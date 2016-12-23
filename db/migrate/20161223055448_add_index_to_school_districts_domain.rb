class AddIndexToSchoolDistrictsDomain < ActiveRecord::Migration[5.0]
  def change
    add_index :school_districts, :domain, unique: true
  end
end
