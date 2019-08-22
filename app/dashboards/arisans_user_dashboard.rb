require "administrate/base_dashboard"

class ArisansUserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    arisan: Field::BelongsTo,
    user_bayar_arisans: Field::HasMany,
    id: Field::Number,
    daftar: Field::Boolean,
    ikut: Field::Boolean,
    tarik: Field::Boolean,
    nama_peserta: Field::String,
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
    :arisan,
    :daftar,
    :nama_peserta,
    :ikut,
    :tarik,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :arisan,
    :user_bayar_arisans,
    :id,
    :daftar,
    :ikut,
    :tarik,
    :nama_peserta,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :arisan,
    :user_bayar_arisans,
    :nama_peserta,
    :daftar,
    :ikut,
    :tarik,
  ].freeze

  # Overwrite this method to customize how arisans users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(arisans_user)
  #   "ArisansUser ##{arisans_user.id}"
  # end
end
