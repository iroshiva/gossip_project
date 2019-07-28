require 'csv'
# csv : pour pouvoir sauvegarder dans la base de données

class Gossip
# Le model est une autre classe Ruby qui va avoir pour rôle d'interagir avec la base de données sur demande du controller. Généralement, il s'agit pour lui de récupérer des informations (qui doivent ensuite être affichées à l'utilisateur) sous la forme d'objets.

# Le Modèle va piocher dans la base de données et renvoyer des objets de la classe Gossip, chacun étant lié à ses variables d'instance, ici un author et un content.

	attr_reader :author, :content
	# appelle les VARIABLES D'INSTANCE

	def initialize(content, author)

		# instancie les variables
		@author = author
		@content = content 

		# initie un array de stockage des variables
		@arr_gossip = [@content, @author]

	end

	def save
	# entrée == 0
	# méthode d'instance chargée de sauvegarder, via la gem 'csv', chaque @arr_gossip, donc chaque potin (sous forme de tableau) contenant l'author et le content 
		
		CSV.open("db/gossip.csv", "a") { |f| f << @arr_gossip }
		# f == ligne de potin == @arr_gossip

	end

	def self.all
	# IMPORTANT : METHOD DE CLASS CAR ON VEUT TOUS LES ELEMENTS DE LA CLASSE ET PAS DE L'INSTANCE!!!!!!!
	# entrée == 0
	# méthode chargée de récupérer tous les gossip

		all_gossip = []
		# tous les gossip seront stockés dans un array

		CSV.open("db/gossip.csv").each do |potin|
		# pour chaque potin, donc chaque ligne du fichier de sauvarde CSV
		
		goss_prov = Gossip.new(potin[0], potin[1])
		# crétion d'une instance gossip == OBJET avec ces deux variables d'instance
		# IMPORTANT: LES POTINS SAUVEGARDÉS PERDENT LEUR STATUT D'OBJET, C'EST POUR ÇA QU'IL FAUT LEUR "REDONNER VIE" EN LES CRÉANT À NOUVEAU !!!!!

		all_gossip << goss_prov
		# mettre chaque instance dans le array all_gossip

		end

		

		return all_gossip
	end

end

# binding.pry
# puts "end of file"