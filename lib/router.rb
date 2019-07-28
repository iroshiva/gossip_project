require 'controller'
# Le router aiguille vers le bon controller

class Router
#  L'utilisateur va aller sur l'application en saisissant une URL (= une adresse web). 
# Le routeur, qui reçoit cette URL, s'occupe de router l'utilisateur vers le bon controller. Par exemple, si l'utilisateur va sur la page facebook.com/mes_messages, le routeur va rediriger sa requête au controller qui s'occupe d'afficher tout ce qui est relatif aux messages. Si l'utilisateur était allé sur facebook.com/mon_profil, le routeur aurait redirigé la requête au controller qui s'occupe d'afficher ce qui est relatif aux profils.

# Donc le routeur redirige l'utilisateur vers le bon controller (qui n'est autre qu'une classe Ruby). 

# Le routeur va devoir être plus spécifique que de simplement pointer vers un controller. Au final, il va rediriger l'utilisateur vers une méthode précise du BON controller.


	def initialize
	# CHAQUE INSTANCE DE CLASS DOIT ÊTRE INITIALISÉE == COMME LUI DONNER VIE AVEC SES BAGAGES DE VIE, S'IL Y EN A
	# methode de class initialize appliquée à chaque nouvelle instance
	# dès qu'une nouvelle instance de class est créée, initialize va initialiser la class == lui assigner ses variables ==> @

		@controller = Controller.new
		# ici, la nouvelle instance routeur initialise une nouvelle instance controller
		# on veut qu'un "Router.new" lancé par app.rb, crée automatiquement une instance "@controller"
		# la class routeur n'appelle aucune variable pour les instances router créées
		# elle sert à initialiser une instance de class controller @

		@prompt = TTY::Prompt.new
		# pour la gem 'tty-prompt' == sélecteur de choix

		
	end

	def perform
	# methode d'instance perform appliquée à chaque nouvelle instance router créée
	# entrée == 0
	# action : aficher le début du programme
	# sort : la valeur de la varible params == choix de l'utilisateur

		puts "BIENVENUE DANS THE GOSSIP PROJECT"

		while true
		# boucle d'affichage infinie
		# elle sera toujours vrai, sauf pour la 4ème option == break

			case_choice = ["Créer un gossip?", "Afficher tous les gossip?", "Quiter l'app?"]
			#création d'un array de choix

			params = @prompt.select("Bonjour à toi THPiste!? Que veux-tu faire?", case_choice)
			# sélecteur de choix

			# puts "Bonjour à toi THPiste!"
			# puts "Que veux-tu faire?"
			# puts "Créer un gossip? Tape 1!"
			# puts "Afficher tous les gossip? Tape 2!"
			# puts "Quiter l'app? Tape 4!"
			# params = gets.chomp.to_i
			# variable params qui a comme valeur le choix de l'utilisateur

			case params
			when case_choice[0]
				puts " "
				puts "Tu as choisi de créer un gossip!"
				@controller.create_gossip
				# si l'utilisateur tape1 , l'instance routeur va diriger la demande de l'utilisateur vers la méthode d'instance create_gossip de l'instance de class controller créée dans la methode initialize ci-dessus

			when case_choice[1]
				puts " "
				puts "Tu as choisi d'afficher tous les potins!"
				@controller.index_gossip
				# si l'utilisateur tape 2, l'instance routeur va diriger la demande de l'utilisateur vers la méthode d'instance index_gossip de l'instance controller crééé dans la methode initialize ci-dessus

			when case_choice[2]
				puts " "
				puts "A bientôt moussaillon!"
				# seul moyen de sortir de la boucle
				break
			else 
				puts " "
				puts "Ce choix n'existe pas, merci de ressayer!"
			end
		
		end

	end
end