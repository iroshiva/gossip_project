Router.new.perform
# création d'une nouvelle instance == NOUVEL OBJET Routeur auquel on applique la méthode perform
# ==> ALLER DANS LA CLASS ROUTEUR ET VOIR CE QUE FAIT LA METHODE PERFORM 
# affiche le début du programme et demande à l'utilisateur ce qu'il faut faire



# déroulé, étape par étape, d'une création de potins
# l'utilisateur tape 1
# lance @controller.create_gossip
# ==> initialise un @view
# ==> lance la méthode create_gossip:
#  - lance @view.create_gossip == récupération d'un hash contenant l'author et le content demandés
#  - création d'une instance de class Gossip == sort un array avec author et content
#  - gossip.save == sauvegarde le potin dans un fichier.csv



# déroulé, étape par étape, de l'affichage de la liste des potins
# l'utilisateur tape 2
# lance @controller.index_gossip
# ==> initialise un @view
# ==> lance la méthod index_gossip
#  - lance Gossip.all == récupère un array de tous les gossip
#  - lance @view.index_gossip(all_gossip) == affiche la liste de tous les gossip stochés dans l'array