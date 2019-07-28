
class View
# La view s'occupera d'afficher les bonnes informations à l'utilisateur, mais aussi de recupérer des informations

	def initialize
		# instancie la class view
	end

	def create_gossip
	# entrée == 0

	# méthode d'instance chargée d'afficher les demandes de prenom et de potins à l'utilisateur et de les récupérer
	
		puts "Yo THPiste! Quel est ton prénom?"
		author = gets.chomp


		puts "Déballe ton potin!"
		content = gets.chomp

		return params = {content: content, author: author}
		# sortie == stockage de author(=prénom de l'utilisateur) et content(=potin de l'utilisateur) dans un hash
	end

	def index_gossip(all_gossip)
	# prend en entrée l'array de tous les gossip
	# comme set array n'est pas déclaré en variable d'instance, il faut l'appeler (all_gossip)

		puts "Voici la liste de tous les potins!!!"

		all_gossip.each do |potin|
		# pour chaque élément appelé potin de l'array de tous les gossip QUI ONT ÉTÉ À NOUVEAU INSTANCIÉS

			puts "#{potin.content}, #{potin.author}"
			# afficher chaque potin
			# comme objet, on affiche les author et content

		end

	end

end