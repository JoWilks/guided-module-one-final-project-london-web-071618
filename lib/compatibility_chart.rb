class CompatibilityChart < ActiveRecord::Base
  # belongs_to :person
  # belongs_to :person_letter
  def self.find_my_compatibility(type)
    CompatibilityChart.all.find{|chart| chart.main_type == type}
  end


end
