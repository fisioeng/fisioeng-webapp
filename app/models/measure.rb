class Measure < ActiveRecord::Base
  paginates_per 25
  max_paginates_per 100
  belongs_to :analyte

  def self.by_series offset=1, limit=25
    query = []

    self.group(:serie).each_with_index do |group, index|

      current_query = self.where(serie: group.serie)
                          .limit(limit)
                          .offset(offset * limit)

      query << current_query

    end

    query
  end
end
