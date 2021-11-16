User.destroy_all

benj = User.create!(name: 'benjamin', pseudo: 'BetterCallBen', description: 'le meilleur joueur du 4 cartes', phone_number: '0613653334', address: '41 avenue lamartine', password: "secret", email: 'benjamin@gmail.com')
eric = User.create!(name: 'eric', pseudo: 'Wagonnet', description: 'le meilleur joueur du ping pong', phone_number: '0623794874', address: '1 rue montaigne', password: "secret", email: 'eric@gmail.com')
mael = User.create!(name: 'mael', pseudo: 'Xund', description: 'le vrai meilleur joueur de ping pong', phone_number: '0713653334', address: 'Dommartin', password: "secret", email: 'mael@gmail.com')
robin = User.create!(name: 'robin', pseudo: 'Mauresque', description: 'poker menteur', phone_number: '0642434445', address: 'Montée de fourvière', password: "secret", email: 'robin@gmail.com')

puts "#{User.count} were created"

Game.create!(name: "4 cartes", number_of_players: "2-5", category: "cartes", description: "un super jeu de mémoire et de stratégie", price: 10, owner: benj)
Game.create!(name: "risks", number_of_players: "2-6", category: "stratégie", description: "un super jeu stratégie", price: 15, owner: eric)
Game.create!(name: "Bang", number_of_players: "7+", category: "stratégie", description: "deviens la terreur de l'ouest", price: 19, owner: mael)

puts "#{Game.count} were created"
