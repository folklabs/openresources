class Offer
  include Mongoid::Document

  embedded_in :organisation
  # embeds_one :process, class_name: "OpenResources::Process", inverse_of: nil
  has_and_belongs_to_many :process, class_name: "OpenResources::Process", inverse_of: nil
  # accepts_nested_attributes_for :process
  # has_and_belongs_to_many :process, inverse_of: nil
  has_and_belongs_to_many :materials, inverse_of: nil

  include Mongoid::Timestamps # adds created_at and updated_at fields

  def matches_waste_level(level)
    match = false
    case level
      when 'reuse'
        case business_function
          when 'http://purl.org/goodrelations/v1#Repair'
            match = true
          when 'http://purl.org/goodrelations/v1#Buy'
            match = true
          # end
        end 
      # end
      when 'recycle'
        case business_function
          when 'http://purl.org/goodrelations/v1#Dispose'
            match = true
          # end
        end 
      # end
    end
    match
  end

end
