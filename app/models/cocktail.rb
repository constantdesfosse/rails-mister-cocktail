class Cocktail < ActiveRecord::Base

has_attached_file :image, styles: { large: "450x450", medium: "300x300>", thumb: "100x100>" }
validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, uniqueness: true, presence: true
  validates :image, presence: true

end
