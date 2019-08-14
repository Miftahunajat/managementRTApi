require "administrate/base_dashboard"

class PengeluaranDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    bulan: Field::BelongsTo,
    list_pengeluarans: Field::HasMany,
    id: Field::Number,
    tahun: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :bulan,
    :list_pengeluarans,
    :id,
    :tahun,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :bulan,
    :list_pengeluarans,
    :id,
    :tahun,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :bulan,
    :list_pengeluarans,
    :tahun,
  ].freeze

  # Overwrite this method to customize how pengeluarans are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(pengeluaran)
    "Pengeluaran #{pengeluaran.bulan.nama_bulan} #{pengeluaran.tahun}"
  end
end
