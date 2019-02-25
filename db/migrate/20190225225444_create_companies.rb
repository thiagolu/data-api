class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :zip
      t.string :website, default: ''
      t.string :uuid

      t.timestamps
    end
  end
end
