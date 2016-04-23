class CustomerAccomodation < ActiveRecord::Base

  belongs_to :authorized_device
  belongs_to :accomodation
  belongs_to :customer

  validates_associated :accomodation

end
