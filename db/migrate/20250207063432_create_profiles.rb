class CreateProfiles < ActiveRecord::Migration[8.0]
  def up
    create_table :profiles, id: false, primary_key: :did do |t|
      t.string :did
      t.string :handle
      t.string :avatar

      t.timestamps
    end

    execute "ALTER TABLE profiles ADD PRIMARY KEY (did);"
  end

  def down
    drop_table :profiles
  end
end
