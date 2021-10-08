class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|

      t.references :city, null: false, foreign_key: true
 

      t.datetime  :local_observation_date_time
      t.float     :temperature_value

      t.timestamps
    end
  end
end
