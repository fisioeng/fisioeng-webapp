@user = User.create!({:email => "obama@email.com", :password => "obama123", :password_confirmation => "obama123" })

@company = Company.create! user: @user, alias: 'Univasf', cnpj: '09437591000133'
@branch  = @company.branches.create! alias: 'Any'
@analyte = @branch.analytes.create! name: 'Tier'
@sampling = @analyte.samplings.create! name: 'Example'

@fields = []

def gen_f unit, range, label
  f = []
  m = 0
  h = 0
  for i in 1..100
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
      dateandtime: Time.utc(Time.now.year, Time.now.month, Time.now.day, h, m, 0),
      serie: label,
      serie_label: label
    }
  end
end

gen_f '°C', 29..44, 'tempcontrol'
gen_f '°C', 29..44, 'tempvariation1'
gen_f '%', 10..80, 'uracontrol'
gen_f '%', 10..80, 'uravariation1'

Measure.create!(@fields)

