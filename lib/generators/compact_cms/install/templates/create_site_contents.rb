class CreateSiteContents < ActiveRecord::Migration[6.0]
  def change
    create_table :site_contents do |t|
      t.timestamps
      t.text :text
      t.integer :type, index: true
      t.integer :site, index: true
      t.belongs_to :parent
      t.integer :order_number, index: true
      
      t.index [:type, :site]
      t.index [:site, :type]
    end
  end
end
