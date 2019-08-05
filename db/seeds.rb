# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

JenisKelamin.create!([{ nama: 'Pria' }, { nama: 'Wanita' }])
user1 = User.create!(
    { nama: 'Ali khadafi', jenis_kelamin_id: 1 , password: '234'}
)
user2 = User.create!({nama: 'Lady Gaga', jenis_kelamin_id: 2, kepala_keluarga: user1})
Role.create!([{ name: 'Admin Arisan', code: 1}, { name: 'Admin Iuran', code: 2}, { name: 'Pengurus RT', code: 3 }])
Bulan.create!([
    { nama_bulan: 'Januari' },
    { nama_bulan: 'Februari' },
    { nama_bulan: 'Maret' },
    { nama_bulan: 'April' },
    { nama_bulan: 'Mei' },
    { nama_bulan: 'Juni' },
    { nama_bulan: 'Juli' },
    { nama_bulan: 'Agustus' },
    { nama_bulan: 'September' },
    { nama_bulan: 'Oktober' },
    { nama_bulan: 'November' },
    { nama_bulan: 'Desember' }
])
arisan = Arisan.create!({ nama: 'Arisan Ibu ibu 1', mulai: DateTime.now, jenis_kelamin_id: 1})
arisans_user = ArisansUser.create!({user: User.first, arisan: Arisan.first})