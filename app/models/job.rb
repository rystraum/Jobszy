class Job
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  field :title, type: String
  field :description, type: String
  field :start_at, type: DateTime
  field :location_name, type: String
  field :pay, type: Integer
  field :payment_term, type: String
  field :is_urgent, type: Boolean

  belongs_to :user
  

end
