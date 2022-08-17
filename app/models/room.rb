class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations, dependent: :destroy
    mount_uploader :image, ImageUploader

    validates :name, presence: true
    validates :introduction, presence: true
    validates :fee, presence: true
    validates :address, presence: true

end
