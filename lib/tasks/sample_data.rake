namespace :db do
    desc "Fill database with sample data"
    task populate: :environment do
      User.create!(name: "sreeram",
                   email: "sree@g.com",
                   password: "maruthi",
                   address:"navalur",
                   phone:"8072991914")

    User.create!(name: "sankar",
    email: "san@g.com",
    password: "maruthi",
    address:"navalur",
    phone:"8072991914")

    User.create!(name: "magesh",
    email: "mag@g.com",
    password: "maruthi",
    address:"navalur",
    phone:"8072991914")

    Agent.create!(name: "Dominos",
    email: "dom@g.com",
    password: "maruthi",
    address:"navalur",
    phone:"8072991914",
    items:"pizza,garlic bread,pepsi,zingy parcel,potato wedges")

    Agent.create!(name: "Hotel Quality and Taste",
    email: "qt@g.com",
    password: "maruthi",
    address:"navalur",
    phone:"8072991914",
    items:"idli,dosa,parotta,chapathi,idiyappam,vadai,bonda")

    Agent.create!(name: "Sangeetha",
    email: "sangeetha@g.com",
    password: "maruthi",
    address:"navalur",
    phone:"8072991914",
    items:"idli,dosa,parotta,chapathi,idiyappam,chilli gobi,paneer tikka")
      
    end
  end