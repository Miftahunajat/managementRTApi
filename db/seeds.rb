# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

JenisKelamin.first_or_create!([{ nama: 'Pria' }, { nama: 'Wanita' }])
Role.first_or_create!([{ name: 'Admin Arisan', code: 1}, { name: 'Admin Iuran', code: 2}, { name: 'Pengurus RT', code: 3 }])
Bulan.first_or_create!([
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
# arisan = Arisan.first_or_create!({ nama: 'Arisan Ibu ibu 1', mulai: DateTime.now, jenis_kelamin_id: 1, iuran: 5000, selesai: DateTime.now + 360})
# arisans_user = ArisansUser.first_or_create!({user: User.first, arisan: Arisan.first})
HargaIuran.first_or_create!([
    {code: 1, nama_iuran: 'Sosial', harga: '15000'},
    {code: 2, nama_iuran: 'Sampah', harga: '15000'},
])

# Pengunguman.first_or_create!([
#     {title: 'Kumpul warga rt 02', body: 'lorem_ipsum_dolor_sit_amet lorem_ipsum_dolor_sit_amet lorem_ipsum_dolor_sit_amet lorem_ipsum_dolor_sit_amet lorem_ipsum_dolor_sit_amet lorem_ipsum_dolor_sit_amet lorem_ipsum_dolor_sit_amet lorem_ipsum_dolor_sit_amet lorem_ipsum_dolor_sit_amet lorem_ipsum_dolor_sit_amet' , tanggal: DateTime.now}
# ])