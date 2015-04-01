class Measure < ActiveRecord::Base
  paginates_per 50
  max_paginates_per 100

  def getBySerie

  end

  belongs_to :analyte
end

#SELECT * FROM measures where serie in (SELECT serie FROM measures GROUP BY serie HAVING COUNT(*) > 1)
