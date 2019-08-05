require "administrate/base_dashboard"

class UserBayarArisanDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    arisans_user: Field::BelongsTo,
    bulan: Field::BelongsTo,
    id: Field::Number,
    tahun: Field::String,
    bayar: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :arisans_user,
    :bulan,
    :id,
    :tahun,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :arisans_user,
    :bulan,
    :id,
    :tahun,
    :bayar,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :arisans_user,
    :bulan,
    :tahun,
    :bayar,
  ].freeze

  # Overwrite this method to customize how user bayar arisans are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user_bayar_arisan)
  #   "UserBayarArisan ##{user_bayar_arisan.id}"
  # end
end
