class Place
  include Mongoid::Document
  
  field :name, type: String
  field :latitude, type: Float
  field :longitude, type: Float
  
  # validates :latitude, :longitude, :format => { :with => %r([0-9]+\.[0-9]*) }, :if => Proc.new {|p| (p.latitude.present? && p.longitude.present?) }

end
