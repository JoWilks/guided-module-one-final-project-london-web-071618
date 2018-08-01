class RenameTableFunctionAnalyses < ActiveRecord::Migration

  def change
    rename_table :function_analysis, :function_analyses
  end
end
