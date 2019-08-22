require "administrate/base_dashboard"

class ArisanDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    users: Field::HasMany,
    arisans_users: Field::HasMany,
    id: Field::Number,
    nama: Field::String,
    mulai: Field::DateTime,
    selesai: Field::DateTime,
    iuran: Field::String,
    jenis_kelamin: Field::BelongsTo.with_options(class_name: "JenisKelamin"),
    tutup: Field::Boolean,
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
    :nama,
    :users,
    :arisans_users
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :users,
    :arisans_users,
    :id,
    :nama,
    :mulai,
    :selesai,
    :iuran,
    :jenis_kelamin,
    :tutup,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :users,
    # :arisans_users,
    :nama,
    :mulai,
    :selesai,
    :iuran,
    :jenis_kelamin,
    :tutup
  ].freeze

  # Overwrite this method to customize how arisans are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(arisan)
    "#{arisan.nama}"
  end
end
