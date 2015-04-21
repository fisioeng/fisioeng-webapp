class Measure < ActiveRecord::Base
  belongs_to :sampling

  paginates_per 10
  max_paginates_per 100

  def self.by_series offset=1, limit=10
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
