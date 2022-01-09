class Organisation < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :organisation_memberships, dependent: :restrict_with_error

  has_one_attached :logo

end
