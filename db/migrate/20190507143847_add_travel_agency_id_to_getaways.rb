class AddTravelAgencyIdToGetaways < ActiveRecord::Migration[5.2]
  def change
    add_column :getaways, :travel_agency_id, :integer
  end
end
