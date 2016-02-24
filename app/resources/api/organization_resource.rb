module Api
  class OrganizationResource < JSONAPI::Resource
    attributes :name
    # attributes :path

    has_many :offers

    def self.apply_filter(records, filter, value)
      puts 'apply_filter'
      records.in(filter => value)
    end
  end
end
