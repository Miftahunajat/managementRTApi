require "administrate/base_dashboard"

class IuranDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    bulan: Field::BelongsTo,
    id: Field::Number,
    tahun: Field::String,
    sampah: Field::Boolean,
    sosial: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :user,
    :bulan,
    :tahun,
    :sosial,
    :sampah
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :bulan,
    :id,
    :tahun,
    :sampah,
    :sosial,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :bulan,
    :tahun,
    :sampah,
    :sosial,
  ].freeze

  # Overwrite this method to customize how iurans are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(iuran)
  #   "Iuran ##{iuran.id}"
  # end
end
