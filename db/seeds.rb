require 'open-uri'
require 'json'
require 'date'

puts "------------------------------"
puts "----------Start seed----------"
puts "------------------------------"
sleep(1)

puts "#destroy_all start ..."

Newsletter.destroy_all

Job.destroy_all

Candidat.destroy_all

Recruteur.destroy_all

User.destroy_all

puts "#destroy_all done"
sleep(1)
puts "#create User start ..."

fabien = User.new(email: 'fabien@test.com', password: 'azerty', nom: 'Suhas', prenom: 'Fabien')
fabien.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?man"), filename: "fabien.png", content_type: "image/png")
fabien.save!

jessica = User.new(email: "jessica@test.com", password: 'azerty', nom: 'Bolle', prenom: 'Jessica')
jessica.save!

puts "#create User done"
sleep(1)
puts "#create Candidat Recruteur start ..."

candidat = Candidat.new(nom: 'fabien', user: fabien, departement: '75', telephone: '0606060606', sexe: 'Homme')
candidat.save!

recruteur = Recruteur.new(user: jessica)
recruteur.save!

puts "#creat Candidat Recruteur done"

job = Job.new(titre: 'Comédien 25 ans pub réseaux sociaux', recruteur: recruteur, departement: '75', date: '25/12/2022', role: 'Comédien', sexe: 'Homme', description: 'Recherche comédien 25 ans pour vidéos réseaux sociaux (témoignages, avis clients, retours d’expériences).Thème :application E SPORTTournage 1 journée / demi journée à Paris le 10 octobre 2022 Prestation rémunérée au minimum selon le barème syndical Merci de joindre une vidéo de présentation de 30 secondes - format selfi vertical + bande démo. OBJET : H 25 E SPORT Axel Laufer (ngagecast@gmail.com)', age: 25)
job.save!

job1 = Job.new(titre: 'Comédien 25 ans pub réseaux sociaux', recruteur: recruteur, departement: '75', date: '25/12/2022', role: 'Comédien', sexe: 'Homme', description: 'Recherche comédien 25 ans pour vidéos réseaux sociaux (témoignages, avis clients, retours d’expériences).Thème :application E SPORTTournage 1 journée / demi journée à Paris le 10 octobre 2022 Prestation rémunérée au minimum selon le barème syndical Merci de joindre une vidéo de présentation de 30 secondes - format selfi vertical + bande démo. OBJET : H 25 E SPORT Axel Laufer (ngagecast@gmail.com)', age: 25)
job1.save!

job2 = Job.new(titre: 'Comédien 25 ans pub réseaux sociaux', recruteur: recruteur, departement: '75', date: '25/12/2022', role: 'Comédien', sexe: 'Homme', description: 'Recherche comédien 25 ans pour vidéos réseaux sociaux (témoignages, avis clients, retours d’expériences).Thème :application E SPORTTournage 1 journée / demi journée à Paris le 10 octobre 2022 Prestation rémunérée au minimum selon le barème syndical Merci de joindre une vidéo de présentation de 30 secondes - format selfi vertical + bande démo. OBJET : H 25 E SPORT Axel Laufer (ngagecast@gmail.com)', age: 25)
job2.save!

job3 = Job.new(titre: 'Comédien 25 ans pub réseaux sociaux', recruteur: recruteur, departement: '75', date: '25/12/2022', role: 'Comédien', sexe: 'Homme', description: 'Recherche comédien 25 ans pour vidéos réseaux sociaux (témoignages, avis clients, retours d’expériences).Thème :application E SPORTTournage 1 journée / demi journée à Paris le 10 octobre 2022 Prestation rémunérée au minimum selon le barème syndical Merci de joindre une vidéo de présentation de 30 secondes - format selfi vertical + bande démo. OBJET : H 25 E SPORT Axel Laufer (ngagecast@gmail.com)', age: 25)
job3.save!

sleep(1)

puts "------------------------------"
puts "----------Seed end !----------"
puts "------------------------------"

sleep(1)
