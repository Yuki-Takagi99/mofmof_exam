class Property < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations, reject_if: :reject_both_blank, allow_destroy: true
  #reject_ifで指定した条件に合致した場合、子要素を作成しない
  #arrow_destroy trueで削除可能にする
  validates :property_name, presence: true, length: { minimum: 1, maximum: 255 }
  validates :rental_price, presence: true
  validates :address, presence: true, length: { minimum: 1, maximum: 255 }
  validates :age, presence: true

  def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:line_name].blank? and attributes[:station_name].blank? and attributes[:distance_on_foot].blank?
      !attributes[:line_name].blank? and attributes[:station_name].blank? and attributes[:distance_on_foot].blank?
    else
      attributes[:line_name].blank? and attributes[:station_name].blank? and attributes[:distance_on_foot].blank?
    end
  end
end
