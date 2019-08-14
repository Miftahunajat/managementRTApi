require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    kepala_keluarga: Field::BelongsTo.with_options(class_name: "User"),
    # keluarga: Field::HasMany.with_options(class_name: "User"),
    roles: Field::HasMany,
    # arisans: Field::HasMany,
    iurans: Field::HasMany,
    bayar_arisans: Field::HasMany.with_options(class_name: "UserBayarArisan"),
    arisans_user: Field::HasMany,
    id: Field::Number,
    nama: Field::String,
    password: Field::String,
    no_hp: Field::String,
    jenis_kelamin: Field::BelongsTo.with_options(class_name: "JenisKelamin"),
    alamat: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    user_kk: Field::BelongsTo.with_options(class_name: "User"),
    image_url: Field::Carrierwave,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :nama,
    :kepala_keluarga,
    # :keluarga,
    # :roles,
    # :arisans,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    # :kepala_keluarga,
    # :keluarga,
    # :roles,
    # :arisans,
    :iurans,
    # :bayar_arisans,
    :arisans_user,
    :id,
    :nama,
    :password,
    :no_hp,
    :jenis_kelamin,
    :alamat,
    :created_at,
    :updated_at,
    :user_kk,
    :image_url,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :kepala_keluarga,
    # :keluarga,
    :roles,
    # :arisans,
    # :iurans,
    # :bayar_arisans,
    # :arisans_user,
    :nama,
    :password,
    :no_hp,
    :jenis_kelamin,
    :alamat,
    :user_kk,
    :image_url,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.nama}"
  end
end
