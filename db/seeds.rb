# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

# puts $:

puts 'Creating stages'
# stage = FactoryGirl.create(:stage, name: 'Reuse', description: 'Any operation where products or materials that are not waste are used again for the same purpose for which they were intended', row_order: 2)

unless Stage.first
  seed_file = Rails.root.join('db', 'stages.yml')
  config = YAML::load_file(seed_file)
  # puts config
  config.each { |c| Stage.create!(c) }
end

Material.delete_all
EconomicProcess.delete_all
Organization.delete_all

unless Material.first
  data = CSV.read('db/materials.csv', :headers => true, :header_converters => :symbol)
  data.each do |row|
    row[:name].downcase!
    puts row
    item = Material.create!(row.to_hash)
  end
end

unless EconomicProcess.first
  data = CSV.read('db/processes.csv', :headers => true, :header_converters => :symbol)
  data.each do |row|
    puts row
    item = EconomicProcess.create!(row.to_hash)
  end
end


unless Organization.first
  data = CSV.read('db/resources.csv', :headers => true, :header_converters => :symbol)
  data.each do |row|
    puts row
    item = Organization.create!(row.to_hash)
    offer = Offer.new(organization: item)
    if row[:materials]
      material_names = row[:materials].split(';')
      material_names.each {|m| m.strip }
      puts material_names
      material_ids = material_names.map { |m| Material.where(name: m).first }
      offer.materials = material_ids
    end
    puts row[:process]
    offer.economic_process = EconomicProcess.where(name: row[:process]).first if row[:process]
    offer.save!
  end
end


# bike = OpenResources::EconomicResourceType.new('http://openresources.io/bicycle')
# bike.label = "Bicycle"
# bike.save!

# org = OpenResources::Organization.new('http://openresources.io/bobs-bikes')
# org.name = "Bob's bikes"
# org.url = 'http://www.bobsbikes.com'
# org.save!

# # org.offers = [offer]
# # org.save!

# offer = OpenResources::Offer.new('http://openresources.io/bobs-offer')
# offer.item_offered = bike
# offer.offered_by = org
# offer.business_function = 'http://purl.org/goodrelations/v1#Repair'
# offer.save!

# org = OpenResources::Organization.new('http://openresources.io/oxfam')
# org.name = "Oxfam"
# org.url = 'http://www.oxfam.co.uk'
# org.save!

# offer = OpenResources::Offer.new('http://openresources.io/oxfam-offer')
# offer.item_offered = bike
# offer.offered_by = org
# offer.business_function = 'http://purl.org/goodrelations/v1#Buy'
# offer.save!

# org.offers = [offer]
# org.save!

