module Api
  class OfferResource < JSONAPI::Resource
    has_one :organization, always_include_linkage_data: true
    has_one :economic_process
    has_many :materials

    filter :material

    def self.find(filters, options = {})
      context = options[:context]
      material_id = filters[:material][0]
      offers = Offer.where({ 'material_ids': material_id })
      offers.each.map do |m|
        self.new(m, context)
      end
    end

  end
end
