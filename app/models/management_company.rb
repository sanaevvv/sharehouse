class ManagementCompany < ApplicationRecord
  has_many :rooms, dependent: :destroy
end
