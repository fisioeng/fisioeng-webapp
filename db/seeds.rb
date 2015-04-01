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

@company = Company.create
@branch  = @company.branches.create
@analyte = @branch.analytes.create

fields =[]

100000.times do
  field << {
    analyte: @analyte,
    value: '',
    unit: nil,
    dateandtime: nil,
    serie: 'serie1',
    serie_label: 'serie1'
  }
end

100000.times do
  fields << {
    analyte: @analyte,
    value: '',
    unit: nil,
    dateandtime: nil,
    serie: 'serie2',
    serie_label: 'serie2'
  }
end

Measure.create!(fields)

