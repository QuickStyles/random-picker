# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ['jon', 'benjen', 'robert', 'syrio', 'eddard', 'viserys', 'drogo', 'renly', 'qhorin', 'jeor', 'beric', 'robb', 'catelyn', 'jeoffery', 'lysa', 'oberyn', 'ygritte', 'shae', 'tywin', 'mance', 'barristan', 'shireen', 'stannis', 'jon', 'roose', 'alliser', 'olle', 'hodor', 'brynden', 'rickon', 'ramsay', 'loras', 'mace', 'kevan', 'margaery']
2.times do |x|
  school = School.create({
    name: "CodeCore College #{x}",
    location: "142 W Hastings St, Vancouver, BC V6B 1G8",
    account_id: "cc_#{x}",
    password: "supersecret",
    password_confirmation: "supersecret",
    email: "codecore_#{x}@codecore.ca"
  })
  
  for value in ['wolf', 'salmon', 'flower', 'kraken', 'deer', 'lion', 'snake', 'dragon', 'sunspear'] do
    classroom = Classroom.create({
      alias: value,
      school: school
    })
    for name in names.sample(20)  do
      Student.create({
        name: name,
        email: "#{name}@gmail.com",
        mark: rand(0.1...4.0),
        classroom:classroom
      })
    end
  end
end