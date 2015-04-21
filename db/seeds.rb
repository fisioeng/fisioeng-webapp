# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require "populator"
# require 'faker'

User.create!({:email => "obama@email.com", :password => "obama123", :password_confirmation => "obama123" })

@company = Company.create!
@branch  = @company.branches.create!
@analyte = @branch.analytes.create!
@sampling = @analyte.samplings.create!

@fields = []

def gen_f unit, range, label
  f = []
  m = 0
  h = 0
  for i in 1..1439
    m += 1
    if i % 60 == 0
      m = 0
      h += 1
    end

    if h % 24 == 0
      h = 0
    end

    @fields << {
      sampling: @sampling,
      value: rand(range),
      unit: unit,
      dateandtime: Time.utc(2015, 4, 20, h, m, 0),
      serie: label,
      serie_label: label
    }
  end
end

gen_f '°C', 29..44, 'control'
gen_f '°C', 29..44, 'variation1'
gen_f '%', 10..80, 'control'
gen_f '%', 10..80, 'variation1'

Measure.create!(@fields)

