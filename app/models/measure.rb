class Measure < ActiveRecord::Base
  belongs_to :sampling

  paginates_per 10
  max_paginates_per 100

  def self.by_series offset=nil, limit=nil, ini_time=nil, end_time=nil
    query = []

    if offset.class == 'Fixnum' && limit.class == 'Fixnum'
      offset = offset * limit
    end

    if ini_time != nil
      ini_time = ["dateandtime >= ?", ini_time]
    end

    if end_time != nil
      end_time = ["dateandtime <= ?", end_time]
    end

    group(:serie).each do |group|

      current_query = where(ini_time)
                      .where(end_time)
                      .where(serie: group.serie)
                      .limit(limit)
                      .offset(offset)




      query << current_query
    end

    query
  end

end
