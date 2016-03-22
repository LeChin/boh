class Recipe < ActiveRecord::Base
  include Fae::BaseModelConcern
  acts_as_list add_new_at: :top

  has_one :image, -> { where(attached_as: 'image') },
    as: :imageable,
    class_name: '::Fae::Image',
    dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  default_scope { order(:position) }

  def fae_display_field
    name
  end

end
