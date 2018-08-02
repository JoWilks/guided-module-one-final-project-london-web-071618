class FunctionAnalysis < ActiveRecord::Base
  def self.get_analysis_by_letter_symbols(letters)
    FunctionAnalysis.all.find{|type| type.symbol == letters}
  end
end
