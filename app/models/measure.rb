class Measure < ActiveRecord::Base
  belongs_to :sampling

  paginates_per 10
  max_paginates_per 100

  # Select series with filter
  def self.by_series offset=nil, limit=nil, ini_dt=nil, end_dt=nil
    query = []

    if offset.class == 'Fixnum' && limit.class == 'Fixnum'
      offset = offset * limit
    end

    if (Date.parse(ini_dt.to_s) rescue false)
      ini_dt = ["dateandtime >= ?", ini_dt]
    end

    if (Date.parse(end_dt.to_s) rescue false)
      end_dt = ["dateandtime <= ?", end_dt]
    end

    group(:serie).each do |group|

      current_query = where(ini_dt)
                      .where(end_dt)
                      .where(serie: group.serie)
                      .limit(limit)
                      .offset(offset)

      query << current_query
    end

    query
  end

end
