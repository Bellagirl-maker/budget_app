class CreateCategoryExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :category_expenses do |t|
      t.references :category, foreign_key: true, null: false
      t.references :expense,  foreign_key: true, null: false

      t.timestamps
    end
  end
end
