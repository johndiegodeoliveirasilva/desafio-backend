class ChangeMaiorDespesaToDeputies < ActiveRecord::Migration[6.0]
  def change
    change_column(:deputies, :maior_despesa, :float, default: 0, null: false)
  end

end
