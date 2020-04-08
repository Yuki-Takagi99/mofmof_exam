class Property < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations, reject_if: :reject_both_blank, allow_destroy: true

  def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:line_name].blank? and attributes[:station_name].blank? and attributes[:distance_on_foot].blank?
      !attributes[:line_name].blank? and attributes[:station_name].blank? and attributes[:distance_on_foot].blank?
    else
      attributes[:line_name].blank? and attributes[:station_name].blank? and attributes[:distance_on_foot].blank?
    end
  end
end
