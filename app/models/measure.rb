class Measure < ActiveRecord::Base
  paginates_per 50
  max_paginates_per 100
  belongs_to :analyte

  def self.by_series group_limit=50

    query = []

    self.group(:serie).each_with_index do |group, index|

      current_query = self.where(serie: group.serie).limit(group_limit)

      query << current_query

    end

    query
  end
end
