class CreateFirehoseState < ActiveRecord::Migration[8.0]
  def change
    create_table :firehose_state, primary_key: [ :key ] do |t|
      t.string :key
      t.string :val

      t.timestamps
    end
  end
end
