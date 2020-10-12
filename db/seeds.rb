# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
    email: 'superadmin@example.org',
    password: '123456',
    username: 'superadmin',
    name: 'Superadmin'
)

# ActivityTitle.create(
#     [
#         { name: 'Rapat' },
#         { name: 'Administrasi' },
#         { name: 'Pekerjaan sesuai Job Desk' },
#         { name: 'Libur' },
#         { name: 'Absen' }
#     ]
# )
#
# Position.create(
#     [
#         { name: 'Engineering' },
#         { name: 'Administrator' },
#         { name: 'Control' }
#     ]
# )
#
# ActivityOutput.create(
#     [
#         { name: 'Notulen Rapat' },
#         { name: 'Timesheet' },
#         { name: 'Dokumen Administrasi' },
#         { name: 'Laporan' },
#         { name: 'Kajian' },
#         { name: 'Maintenance System' },
#         { name: 'Database' }
#     ]
# )
#
# AssignmentPlace.create(
#     [
#         { name: 'Pusat' },
#         { name: 'GDMR1' },
#         { name: 'GDMR2' },
#         { name: 'GDMR3' },
#         { name: 'GTM' }
#     ]
# )
#
# Role.create(
#     [
#         { name: 'Approve1', type: "Role" },
#         { name: 'Approve2', type: "Role" },
#         { name: 'Approve3', type: "Role" },
#         { name: 'Approve4', type: "Role" },
#         { name: 'PM', type: "Role" }
#     ]
# )
#
# ServiceType.create(
#     [
#         { name: 'Kajian tanpa survei lapangan' },
#         { name: 'Kajian dengan survei lapangan' },
#         { name: 'Survei lapangan tanpa peralatan khusus' },
#         { name: 'Survei lapangan dengan peralatan khusus' },
#         { name: 'Pendampingan / Menghadiri rapat koordinasi' }
#     ]
# )