
require 'gossip'
require 'view'
# le controller a besoin de récupérer les informations demandées par l'utilisateur == va demander au model de chercher dans la base de données les infos
# le controller a besoin de view pour récupérer les demandes d'informations de l'utilisateur avant de demander au model... NORMAL!!!!
# Une fois les infos récup, le controller les donne au view pour qu'il les affiche
# DOUBLE FONCTION DU VIEW !!!!!! +/- Récup des infos de l'utilisateur ET affiche les résultats de la demande

class Controller
# AU FINAL : L'APPLICATION EST SOUVENT CONSTITUÉ DE PLUSIEURS CONTROLLERS. CHACUN "CONTROLE" UNE SECTION BIEN PRECISE DU PROGRAMME, PAR EX LES MESSAGES, LES PROFILS, Etc.....
# CHAQUE CONTROLLER GERENT LES FONCTIONNALITÉS DE SA SECTION PAR DES MÉTHODES : PAR EX, LE CONTROLLER MESSAGES AFFICHE LES METHODES DE RECEPTION DE MESSAGES, REDACTION DE MESSAGES, SUPPRESSION DE MESSAGES...
# UNE METHODE PAR ACTION !!!!!!!

# Ici, il n'y a qu'un controller qui gère la section potins, avec 3 méthodes : create_gossip, index_gossip et suppression des potins


	def initialize
	
		@view = View.new
		# Création d'une instance de class view @view d'une nouvelle class View
		# permet d'afficher la suite, en fonction du choix de l'utilisateur, c'est pourquoi elle est créée dans initialize
	end


	def create_gossip
	# entrée == 0
	# method d'instance appliqué à l'instance @controller créée dans l'initialize de la class routeur si l'utilisateur tape 1

		params = @view.create_gossip
		# params == 1 dans ce cas (choix de l'utilisateur) et appelle la méthode d'instance create_gossip de l'instance @view
		# ==> permet d'afficher la demande de prenom de l'utilisateur(=author) et le potin(=content)
		# ET récupère les infos sous la forme d'un Hash (cf @view.create_gossip)

		gossip = Gossip.new(params[:author], params[:content])
		# création d'une instance de class gossip(=MODEL) qui prend en entrée les variables author et content du hash sortie par @view.create_gossip
		# il faut les préciser car la class Gossip prends ces variables en entrée
		# la class Gossip instancie un array avec ces variables

		gossip.save
		# application de la méthode d'instance save à l'instance gossip créée au-dessus
		# sort une sauvegarde contenant l'author et le content du potin de l'utilisateur

	end

	def index_gossip
	# entrée == 0
	# method d'instance chargée d'afficher tous les gossip

		all_gossip = Gossip.all
		# chercher tous les gossip == les extraires de la base de données via le MODEL (=class Gossip), SOUS FORME D'OBJET!!!!!
		# sort le un array de tous les gossip

		@view.index_gossip(all_gossip)
		# les affiche à l'utilisateur

	end

end