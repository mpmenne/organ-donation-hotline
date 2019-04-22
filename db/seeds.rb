# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  TransplantCenter.create(
    name: 'Saint Louis University Hospital',
    phone_number: '+13145778867',
    area_code: '314',
    city: 'Saint Louis',
    state: 'MO'
  )
  TransplantCenter.create(
    name: 'Barnes Jewish Hospital',
    phone_number: '+118668894376',
    area_code: '314',
    city: 'Saint Louis',
    state: 'MO'
  )
  TransplantCenter.create(
    name: 'Cedars Sinai Hospical',
    phone_number: '+13104232641',
    area_code: '310',
    city: 'Los Angeles',
    state: 'CA'
  )
