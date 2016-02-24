module Api
  class MaterialResource < JSONAPI::Resource
    attributes :name
    attributes :path

    def self.apply_filter(records, filter, value)
      puts 'apply_filter'
      records.in(filter => value)
    end
  end
end
