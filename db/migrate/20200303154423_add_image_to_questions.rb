class AddImageToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :image, :string
  end
end
