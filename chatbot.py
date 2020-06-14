import mysql.connector	#import de bdd par mysqlconnector
import unicodedata #import pour remplacer les accents par leurs équivalents ASCII les plus proches
import random	#pour faire des reponse aleatoire
import tkinter as tk#import pour tkinter graphics du chatbot
import os	#import certain systeme de l'os du windows comme le cls
#juste en cas de bug cls mettez le import os en commentaire et tout les ligne ou il y a cls dans la premiere boucle


def normalisation_lettre(input_str):#fonction pour transformez les majuscules en minuscules et enlever les accents on utilisera ascii
    """ supprime les majuscules du texte source """
    input_str1 = input_str.lower()#transformez en minuscule
    #input_str1 = u"%s"%(input_str)
    #input_str1=unicodedata.normalize('NFKD', input_str).encode('ascii', 'ignore')#pour enlever accents
	#sauf pour accents il y a un probleme dans l'insertion des donnees apres dans les input de la liste
    return input_str1
 

def parcourscompa_table_repetition(question):#voir repetition dans une table qu'on doit definir 
    # Pour voir les donnees inserer dans ma bdd
    nom_table=input("Nom de votre table suivant l indice du haut: ")
    QueryCurs.execute('''SELECT * FROM %s'''%(nom_table))
    rows = QueryCurs.fetchall()
    repetition = 0
    for row in rows:
        if row[1] ==question:
            repetition = repetition +1
    if repetition!=0:
        return True
    else:
        return False

def parcourscompa_table_repetition_conversation(question): #voir repetition dans un table conversation
    # Pour voir les donnees inserer dans ma bdd
    QueryCurs.execute('''SELECT * FROM conversation''')
    rows = QueryCurs.fetchall()
    repetition = 0
    for row in rows:
        if row[1] ==question:
            repetition = repetition +1
    if repetition!=0:
        return True
    else:
        return False

#Connection a la base de donnee grace a mysqlconnector ici on va se connecter a wamp par defaut et creer mydatabase comme bdd qu'on va utiliser
CreateDataBase = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="mydatabase"
)

QueryCurs = CreateDataBase.cursor()	#Creation de cursor

root = tk.Tk()#variable python qu on va mettre tkinter
user_input = tk.Entry(root)#on va mettre input du tkinter
user_input.pack()

id_text=canva_text(10,10,text"')

def test modifier():
canva.itemconfigure(id text, text, text='')

#les fetchall sont pour prendre les valeurs de la select sql et apres les utiliser dans une boucle for

if(CreateDataBase):
    print("Connexion reussie")#Afficher connexion reussie si la connexion est établie
else:
    print("Creation de la base et reconnexion")#Afficher le texte dans print si connexion ne marche pas
    QueryCurs.execute("CREATE DATABASE mydatabase")#Creation de notre bdd qui s'appelle mydatabase
    # Fonction pour creer une donnee dans la bdd
def Creerliste():
     donnees = ["",""] #le nombre d element dans la liste doit etre egale au champs
     i=0
     nb=int(input("Entrez le nombre de valeur voulue dont le recommande sinon y aura erreur:"))
     while i < nb:
          donnees[i]= input("Entrez votre champ %s:" %(i+1))
          donnees[i]=normalisation_lettre(donnees[i])#conversion
          i = i +1
     return donnees
		  
def Creerlistelong():
     donnees = ["","","","","","","","","",""] #liste vide ou on va inserer des truc apres
     i=0
     nb=int(input("Entrez le nombre de valeur voulue dont le recommande sinon y aura erreur:"))
     while i < nb:
          donnees[i]= input("Entrez votre champ %s:" %(i+1))
          donnees[i]=normalisation_lettre(donnees[i])#conversion
          i = i +1
     return donnees
		# Fonction pour creer un table conversation dans la bdd
def CreateTable():
    QueryCurs.execute('''CREATE TABLE conversation
    (id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, Question VARCHAR(255),Reponse VARCHAR(255))''')
#fonction pour supprimmer la table
def DeleteTable():
    nomtable=input("Entrez le nom de table a supprimmer:")
    QueryCurs.execute('''DROP TABLE %s''' %(nomtable))

     # Fonction pour inserer des donnees dans la table conversation
def AddEntry():
        QueryCurs.execute('''INSERT INTO conversation (Question,Reponse)
        VALUES ("%s","%s")'''%(liste[0],liste[1]))
        #print("Cette question existe deja\n")

#fonction pour supprimmer une donnee dans la table conversation
def Supprimdonnees():
    numero_id = input('Entrez la ligne a supprimmer dans la table conversation:')
    QueryCurs.execute('''DELETE FROM conversation WHERE id=%s''' %(numero_id))


#fonction pour modfier une donnee dans la table conversation
def Modifdonnees():
        numero_id = input('Entrez la ligne a modifier dans la table conversation:')
        print("Valeur recommande est 2\n")
        liste = Creerliste()
        if liste[0]=='': #Si utilisateur n a rien entree dans question pour inserer
            QueryCurs.execute('''SELECT * FROM conversation WHERE id=%s''' %(numero_id))
            rows = QueryCurs.fetchall()
            for row in rows:
                liste[0]=row[1]
        elif liste[1]=='': #Si utilisateur n a rien entree dans reponse pour inserer
            QueryCurs.execute('''SELECT * FROM conversation WHERE id=%s''' %(numero_id))
            rows = QueryCurs.fetchall()
            for row in rows:
                liste[1]=row[2]
        QueryCurs.execute('''UPDATE conversation
        SET Question ="%s", Reponse ="%s" WHERE id=%s''' %(liste[0],liste[1],numero_id))

#fonction pour voir les tables creer /ne marche pas
def VoirTable():
    QueryCurs.execute('''SHOW TABLES''')
    for i in QueryCurs:
        print(i)
#fonction pour voir les elements dans une table creer
def VoirelemTable():
    # Pour voir les donnees inserer dans ma bdd
    QueryCurs.execute('''SELECT * FROM conversation''')
    rows = QueryCurs.fetchall()
    for row in rows:
        print ("ID: %s" %(row[0]))
        print ("Question: %s" %(row[1]))
        print ("Reponse: %s\n" %(row[2]))			

def Creerlistebotidk(): #liste des choses que le bot va dire si il ne sait pas la question
     donnees = ["","",""] #le nombre d element dans la liste doit etre egale au champs
     i=0
     nb=int(input("Entrez le nombre de valeur voulue:"))
     while i < nb:
          donnees[i]= input("Entrez votre reponse %s aleatoire si Bot ne sait pas:" %(i+1))
          i = i +1
     return donnees

	  
#Fonction pour preparer nos tables sauf la conversation
def preparationtable():
    QueryCurs.execute('''CREATE TABLE `chanteur` ( `id_chanteur` INT NOT NULL AUTO_INCREMENT ,  `nom_artiste` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,  `homme` BOOLEAN NOT NULL ,    PRIMARY KEY  (`id_chanteur`)) ENGINE = MyISAM''')
    #execution requete sql
    CreateDataBase.commit()#sauvegarde des modifications
    QueryCurs.execute('''CREATE TABLE album ( id_album INT NOT NULL AUTO_INCREMENT ,  nom_album VARCHAR(255) NOT NULL ,  nombre_chansons INT NOT NULL ,    PRIMARY KEY  (id_album)) ENGINE = MyISAM''')#execution requete sql
    CreateDataBase.commit()#sauvegarde des modifications
    QueryCurs.execute('''CREATE TABLE type ( id_type INT NOT NULL AUTO_INCREMENT ,  nom_type VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,    PRIMARY KEY  (id_type)) ENGINE = MyISAM''')#execution requete sql
    CreateDataBase.commit()#sauvegarde des modifications
    QueryCurs.execute('''Create Table chanson( id_chanson INT NOT NULL AUTO_INCREMENT ,  titre VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,    PRIMARY KEY  (id_chanson),chanteur_principal INT, chanteur2 INT, chanteur3 INT, chanteur4 INT ,chanteur5 INT, parole TEXT, annee_sortie YEAR, numero_album INT, numero_categorie INT, FOREIGN KEY (chanteur_principal) REFERENCES chanteur (id_chanteur),FOREIGN KEY (chanteur2) REFERENCES chanteur (id_chanteur),FOREIGN KEY (chanteur3) REFERENCES chanteur (id_chanteur),FOREIGN KEY (chanteur4) REFERENCES chanteur (id_chanteur),FOREIGN KEY (chanteur5) REFERENCES chanteur (id_chanteur),FOREIGN KEY (numero_album) REFERENCES album (id_album),FOREIGN KEY (numero_categorie) REFERENCES type (id_type))''')#execution requete sql
    CreateDataBase.commit()#sauvegarde des modifications
    QueryCurs.close();#terminer requete
	
#fonction pour creer dans differentes table preparer
def insertchanson(nbchanteur,nbchamp,listeprepa):	#Fonction pour inserer un chanson
    if nbchanteur==1:
        QueryCurs.execute('''INSERT INTO `chanson`(`titre`, `chanteur_principal`, `parole`, `annee_sortie`, `numero_album`, `numero_categorie`) VALUES
        ("%s","%s","%s","%s","%s","%s")'''%(listeprepa[0],listeprepa[1],listeprepa[2]
        ,listeprepa[3],listeprepa[4],listeprepa[5]))
    elif nbchanteur==2:
        QueryCurs.execute('''INSERT INTO `chanson`(`titre`, `chanteur_principal`, `chanteur2`,`parole`, `annee_sortie`, `numero_album`, `numero_categorie`) VALUES
        ("%s","%s","%s","%s","%s","%s","%s")'''%(listeprepa[0],listeprepa[1],listeprepa[2]
        ,listeprepa[3],listeprepa[4],listeprepa[5],listeprepa[6]))
    elif nbchanteur==3:
        QueryCurs.execute('''INSERT INTO `chanson`(`titre`, `chanteur_principal`, `chanteur2`, `chanteur3`,
        `parole`, `annee_sortie`, `numero_album`, `numero_categorie`)
        VALUES("%s","%s","%s","%s","%s","%s","%s","%s")'''%(listeprepa[0],listeprepa[1],listeprepa[2],listeprepa[3],listeprepa[4],listeprepa[5],listeprepa[6],listeprepa[7]))
    elif nbchanteur==4:
        QueryCurs.execute('''INSERT INTO `chanson`(`titre`, `chanteur_principal`, `chanteur2`, `chanteur3`,
        `chanteur4`, `parole`, `annee_sortie`, `numero_album`, `numero_categorie`) VALUES
        ("%s","%s","%s","%s","%s","%s","%s","%s","%s")'''%(listeprepa[0],listeprepa[1],listeprepa[2]
        ,listeprepa[3],listeprepa[4],listeprepa[5],listeprepa[6],listeprepa[7],listeprepa[8]))
    elif nbchanteur==5:
        QueryCurs.execute('''INSERT INTO `chanson`(`titre`, `chanteur_principal`, `chanteur2`, `chanteur3`,
        `chanteur4`, `chanteur5`, `parole`, `annee_sortie`, `numero_album`, `numero_categorie`) VALUES
        ("%s","%s","%s","%s","%s","%s","%s","%s","%s","%s")'''%(listeprepa[0],listeprepa[1],listeprepa[2]
        ,listeprepa[3],listeprepa[4],listeprepa[5],listeprepa[6],listeprepa[7],listeprepa[8],listeprepa[9]))
    else:
        print("Sayonnara les nuls")
def insertchanteur(listeprepa):		#Fonction pour inserer un chanteur
    QueryCurs.execute('''INSERT INTO `chanteur`(`nom_artiste`, `homme`) VALUES ("%s","%s")'''%(
    listeprepa[0],listeprepa[1]))
def insertalbum(listeprepa):		#Fonction pour inserer un album
    QueryCurs.execute('''INSERT INTO `album`(`nom_album`, `nombre_chansons`) VALUES ("%s","%s")'''%(
    listeprepa[0],listeprepa[1]))
def insertcategorie(listeprepa):	#Fonction pour inserer un type
    QueryCurs.execute('''INSERT INTO `type`(`nom_type`) VALUES ("%s")'''%(listeprepa[0]))
def supprimercategorie():			#Fonction pour supprimer un type
    numero_id = input('Entrez la ligne a supprimmer dans la table conversation:')
    QueryCurs.execute('''DELETE FROM type WHERE id_type=%s''' %(numero_id))
def supprimerchanteur():			#Fonction pour supprimer un chanteur
    numero_id = input('Entrez la ligne a supprimmer dans la table conversation:')
    QueryCurs.execute('''DELETE FROM chanteur WHERE id_chanteur=%s''' %(numero_id))
def supprimeralbum():				#Fonction pour supprimer un album
    numero_id = input('Entrez la ligne a supprimmer dans la table conversation:')
    QueryCurs.execute('''DELETE FROM album WHERE id_album=%s''' %(numero_id))
def supprimerchanson():				#Fonction pour supprimer un chanson
    numero_id = input('Entrez la ligne a supprimmer dans la table conversation:')
    QueryCurs.execute('''DELETE FROM chanson WHERE id_chanson=%s''' %(numero_id))
def modifcategorie():				#Fonction pour modifier un type
        numero_id = input('Entrez la ligne a modifier dans la table categorie:')
        print("Valeur recommande est 1\n")
        liste = Creerliste()
        if liste[0]=='': #Si utilisateur n a rien entree dans question pour inserer
            QueryCurs.execute('''SELECT * FROM type WHERE id_type=%s''' %(numero_id))
            rows = QueryCurs.fetchall()
            for row in rows:
                liste[0]=row[1]
        QueryCurs.execute('''UPDATE type
        SET nom_type ="%s" WHERE id_type=%s''' %(liste[0],numero_id))

def modifchanteur(numero_id,liste):		#Fonction pour modifier un chanteur
        if liste[0]=='': #Si utilisateur n a rien entree dans question pour inserer
            QueryCurs.execute('''SELECT * FROM chanteur WHERE id_chanteur=%s''' %(numero_id))
            rows = QueryCurs.fetchall()
            for row in rows:
                liste[0]=row[1]
        elif liste[1]=='': #Si utilisateur n a rien entree dans reponse pour inserer
            QueryCurs.execute('''SELECT * FROM chanteur WHERE id_chanteur=%s''' %(numero_id))
            rows = QueryCurs.fetchall()
            for row in rows:
                liste[1]=row[2]
        QueryCurs.execute('''UPDATE chanteur
        SET nom_artiste ="%s", homme ="%s" WHERE id_chanteur= "%s"''' %(liste[0],liste[1],numero_id))

def modifalbum(numero_id,liste):	#Fonction pour modifier un album
        if liste[0]=='': #Si utilisateur n a rien entree dans question pour inserer
            QueryCurs.execute('''SELECT * FROM album WHERE id_album=%s''' %(numero_id))
            rows = QueryCurs.fetchall()
            for row in rows:
                liste[0]=row[1]
        elif liste[1]=='': #Si utilisateur n a rien entree dans reponse pour inserer
            QueryCurs.execute('''SELECT * FROM album WHERE id_album="%s"''' %(numero_id))
            rows = QueryCurs.fetchall()
            for row in rows:
                liste[1]=row[2]
        QueryCurs.execute('''UPDATE album
        SET nom_album ="%s", nombre_chansons ="%s" WHERE id_album="%s"''' %(liste[0],liste[1],numero_id))


def modifchanson(numero_id,nbchanteur,nbchamp,listeprepa):#Fonction pour modifier un chanson
    if nbchanteur==1:
        QueryCurs.execute('''UPDATE chanson SET titre="%s", chanteur_principal="%s", parole="%s",
        annee_sortie="%s", numero_album="%s", numero_categorie="%s" WHERE id_chanson="%s"'''%(listeprepa[0]
        ,listeprepa[1],listeprepa[2],listeprepa[3],listeprepa[4],listeprepa[5],numero_id))
    elif nbchanteur==2:
        QueryCurs.execute('''UPDATE chanson SET titre="%s", chanteur_principal="%s", chanteur2="%s",
        parole="%s", annee_sortie= "%s", numero_album="%s",
        numero_categorie="%s" WHERE id_chanson="%s"''' %(listeprepa[0],listeprepa[1],listeprepa[2]
        ,listeprepa[3],listeprepa[4],listeprepa[5],listeprepa[6],numero_id))
    elif nbchanteur==3:
        QueryCurs.execute('''UPDATE chanson SET titre="%s", chanteur_principal="%s", chanteur2="%s",
        chanteur3="%s", parole="%s", annee_sortie="%s", numero_album="%s",
        numero_categorie="%s" WHERE id_chanson="%s"''' %(listeprepa[0],listeprepa[1],listeprepa[2],listeprepa[3],listeprepa[4],listeprepa[5],listeprepa[6],listeprepa[7],numero_id))
    elif nbchanteur==4:
        QueryCurs.execute('''UPDATE chanson SET titre="%s", chanteur_principal="%s", chanteur2="%s",
        chanteur3="%s",chanteur4="%s", parole="%s", annee_sortie="%s", numero_album="%s",
        numero_categorie="%s" WHERE id_chanson="%s"''' %(listeprepa[0],listeprepa[1],listeprepa[2]
        ,listeprepa[3],listeprepa[4],listeprepa[5],listeprepa[6],listeprepa[7],listeprepa[8],numero_id))
    elif nbchanteur==5:
        QueryCurs.execute('''UPDATE chanson SET titre="%s", chanteur_principal="%s", chanteur2="%s",
        chanteur3="%s",chanteur4="%s", chanteur5="%s", parole="%s", annee_sortie="%s", numero_album="%s",
        numero_categorie="%s" WHERE id_chanson="%s"''' %(listeprepa[0],listeprepa[1],listeprepa[2]
        ,listeprepa[3],listeprepa[4],listeprepa[5],listeprepa[6],listeprepa[7],listeprepa[8],listeprepa[9]
        ,numero_id))
    else:
        print("Sayonnara les nuls")

def regardercategorie():#Fonction pour voir les types
    QueryCurs.execute('''SELECT * FROM type''')
    rows = QueryCurs.fetchall()
    for row in rows:
        print ("ID: %s" %(row[0]))
        print ("Nom du type: %s" %(row[1]))
def regarderchanteur():#Fonction pour voir les chanteur
    QueryCurs.execute('''SELECT * FROM chanteur''')
    rows = QueryCurs.fetchall()
    for row in rows:
        print ("ID: %s" %(row[0]))
        print ("Nom de l artiste: %s" %(row[1]))
        print ("Homme(boolean): %s\n" %(row[2]))
def regarderalbum():#Fonction pour voir les album
    QueryCurs.execute('''SELECT * FROM album''')
    rows = QueryCurs.fetchall()
    for row in rows:
        print ("ID: %s" %(row[0]))
        print ("Nom de l album: %s" %(row[1]))
        print ("Nombre de chanson: %s\n" %(row[2]))
def regarderchanson():#Fonction pour voir les chansons
    QueryCurs.execute('''SELECT * FROM chanson''')
    rows = QueryCurs.fetchall()
    for row in rows:
        print ("ID: %s" %(row[0]))
        print ("titre: %s" %(row[1]))
        print ("num chanteur_principal: %s\n" %(row[2]))
        print ("num chanteur2: %s\n" %(row[3]))
        print ("num chanteur3: %s\n" %(row[4]))
        print ("num chanteur4: %s\n" %(row[5]))
        print ("num chanteur5: %s\n" %(row[6]))
        print ("parole: %s\n" %(row[7]))
        print ("annee de sortie: %s\n" %(row[8]))
        print ("numero d'album: %s\n" %(row[9]))
        print ("numero de categorie: %s\n" %(row[9]))
boucle1 = True
reponseidkbot = Creerlistebotidk()#reponse si bot ne sait rien
while boucle1 == True:
    QueryCurs = CreateDataBase.cursor()
    print("1_Pour creer une table conversation\n")
    print("2_Pour voir les table creer")  #y a erreur au niveau requete sql
    print("3_Pour inserer une donnees dans la table conversation\n")
    print("4_Pour voir les donnees dans la table conversation\n")
    print("5_Pour modifier les donnees dans la table conversation\n")
    print("6_Pour supprimmer une table\n")
    print("7_Pour supprimmer une donnee present dans la table conversation\n")
    print("9_Commencer les preparations à faire avant de commencer")
    print("10_inserer un categories de chanson\n")
    print("11_inserer un chanteur\n")
    print("12_inserer un album\n")
    print("13_inserer un chanson\n")
    print("14_modifier un categories de chanson\n")
    print("15_modifier un chanteur\n")
    print("16_modifier un album\n")
    print("17_modifier un chanson\n")
    print("18_supprimmer un categories de chanson\n")
    print("19_supprimmer un chanteur\n")
    print("20_supprimmer un album\n")
    print("21_supprimmer un chanson\n")
    print("22_voir la table categorie\n")
    print("23_voir la table chanteur\n")
    print("24_voir la table album\n")
    print("25_voir la table chanson\n")
    print("8_Pour arrêter les requetes et commencer parler a Bot\n")
    decision = int(input("Quel est votre decision?\n"))
	
    if decision ==1:
        # Appel du fonction pour creer une table dans la bdd
        CreateTable();
        # Pour sauvegarder les requetes avant le truc cad les executer
        CreateDataBase.commit()
        QueryCurs.close()
    elif decision ==3:  
        print("Valeur recommande est 2\n")
        liste = Creerliste()#creation liste
        bool=parcourscompa_table_repetition(liste[0])#boolean pour verif repetition
        if bool==False:
            AddEntry()#Appel du fonction pour inserer une donnees dans la bdd
        else:
            print("ce donnee existe deja")
        # Pour sauvegarder les requetes avant le truc cad les executer
        CreateDataBase.commit()
        QueryCurs.close()
    elif decision ==4:  
        clear = lambda: os.system('cls') #pour effacer la console
        clear()
        VoirelemTable()
        clear = lambda: os.system('pause') #pour effacer la console
        clear()
        QueryCurs.close()
    elif decision ==6:  
        #Appel du fonction pour supprimmer la table
        DeleteTable()
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==7:  
        #Appel du fonction pour supprimmer une ligne de bdd dans table donnee/une donnee
        Supprimdonnees()
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==5:  
        #Appel du fonction pour modifier une ligne de bdd dans table donnee/une donnee
        Modifdonnees()
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==2:  
        #Appel du fonction pour voir les table creer
        VoirTable()
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==9:  
        #Appel du fonction pour inserer une donnees dans la table type ou categorie
        preparationtable()
    elif decision ==10:  
        print("Valeur recommande est 1\n")
        listeprepa= Creerliste()
        print("type\n")
        bool=parcourscompa_table_repetition(listeprepa[0])
		#Appel de fonction pour voir s'il y a repetition dans la table
        if bool==False:
            insertcategorie(listeprepa)	#Appel fonction pour inserer un type
            CreateDataBase.commit()		#sauvegarde des requetes
            QueryCurs.close()			#Fermeture du cursor
        else:
            print("Ce donnee existe deja")		
    elif decision ==11: 
        print("Valeur recommande est 2\n")
        listeprepa= Creerliste()
        print("chanteur\n")
        bool=parcourscompa_table_repetition(listeprepa[0])
		#Appel de fonction pour voir s'il y a repetition dans la table
        if bool==False:
            insertchanteur(listeprepa)	#Appel fonction pour inserer un chanteur
            CreateDataBase.commit()		#sauvegarde des requetes				
            QueryCurs.close()			#Fermeture du cursor
        else:
            print("Ce donnee existe deja")
    elif decision ==12: 
        print("Valeur recommande est 2\n")
        listeprepa= Creerliste()
        print("album\n")
        bool=parcourscompa_table_repetition(listeprepa[0])
		#Appel de fonction pour voir s'il y a repetition dans la table
        if bool==False:
            insertalbum(listeprepa)	#Appel fonction pour inserer un album
            CreateDataBase.commit()	#sauvegarde des requetes				
            QueryCurs.close()		#Fermeture du cursor
    elif decision ==13:  
        #Appel du fonction pour inserer une donnees dans la table chanson
        nbchanteur=int(input("Combien de chanteur est present dans la chanson?\n"))
        nbchamp=nbchanteur + 5
        print("Valeur recommande est %s\n"%(nbchamp))
        listeprepa= Creerlistelong()
        insertchanson(nbchanteur,nbchamp,listeprepa) 	#Appel du fonction pour inserer un chanson
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==14:  
        #Appel du fonction pour voir les table creer
        modifcategorie()	#Appel du fonction pour modifier un categorie
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==15:  
        #Appel du fonction pour voir les table creer
        numero_id = input('Entrez la ligne a modifier dans la table chanteur:')
        print("Valeur recommande est 2\n")
        liste = Creerliste()
        modifchanteur(numero_id,liste)	#Appel du fonction pour modifier un chanteur
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==16:  
        #Appel du fonction pour voir les table creer
        numero_id = input('Entrez la ligne a modifier dans la table album:')
        print("Valeur recommande est 2\n")
        liste = Creerliste()
        modifalbum(numero_id,liste)	#Appel du fonction pour modifier un album
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==17:  
        #Appel du fonction pour voir les table creer
        numero_id = input('Entrez la ligne a modifier dans la table chanson:')
        nbchanteur=int(input("Combien de chanteur est present dans la chanson?\n"))
        nbchamp = nbchanteur + 5
        print("Valeur recommande est %s\n"%(nbchamp))
        listeprepa= Creerlistelong()
        modifchanson(numero_id,nbchanteur,nbchamp,listeprepa)	#Appel du fonction pour modifier un chanson
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==18:  
        supprimercategorie()		#Appel du fonction pour supprimer un categorie
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==19:  
        supprimerchanteur()			#Appel du fonction pour modifier un chanteur
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==20:  
        supprimeralbum()			#Appel du fonction pour modifier un album
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==21:  
        supprimerchanson()			#Appel du fonction pour modifier un chanson
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==22:  
        #Appel du fonction pour voir les table creer
        clear = lambda: os.system('cls') #pour effacer la console
        clear()
        regardercategorie()
        clear = lambda: os.system('pause') #pour effacer la console
        clear()
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==23:  
        clear = lambda: os.system('cls') #pour effacer la console
        clear()
        regarderchanteur()
        clear = lambda: os.system('pause') #pour effacer la console
        clear()
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==24:  
        clear = lambda: os.system('cls') #pour effacer la console
        clear()
        regarderalbum()
        clear = lambda: os.system('pause') #pour effacer la console
        clear()
        CreateDataBase.commit()						
        QueryCurs.close()
    elif decision ==25:  
        clear = lambda: os.system('cls') #pour effacer la console
        clear()
        regarderchanson()
        clear = lambda: os.system('pause') #pour effacer la console
        clear()
        CreateDataBase.commit()						
        QueryCurs.close()
    else:  
        boucle1 = False
        clear = lambda: os.system('cls') #pour effacer la console
        clear()

#Ici commence le code pour l echange bot et user
#Message de bonjour du bot
Botbonjourliste = ["Hey hey ca va toi?","Salut quel chanson voulez vous?","Bonjour Comment puis je vous aider?"]
Botbonjour = random.choice(Botbonjourliste)		#message de bonjour pour mettre en aleatoire
Botrevoirliste = ["Good bye","Arriverdacci","Bye","Au revoir"] #message d'au revoir
Botrevoir = random.choice(Botrevoirliste)	#de meme que ceux du haut pour mettre en aléatoire le message de bonjour du bot
print('Bot: ' + Botbonjour)		#afficher message de bonjour du bot
id_lyrics="lyr"			#initialisation de id_lyrics pour recup l'infos dans la table chanson apres
id_artiste="art"		#initialisation de id_artiste pour recup l'infos dans la table chanteur apres
boolean = False
while True:
    #pour input question du user qu'on var chercher dans la bdd du champs question;
    QueryCurs = CreateDataBase.cursor()	#Creation de cursor	
    question = input('Me: ')
    question = normalisation_lettre(question)#conversion
    #Condition pour arreter la discussion
    if question =='' or question =='bye':
        break
	# Pour faire echange bot et utilisateur grace au donnees entrez dans la base de donnees
	#pour conversation bot et humain
    QueryCurs.execute('''SELECT * FROM conversation''' )
    rows = QueryCurs.fetchall()
    repetition=0
    for row in rows:
        if row[1] ==question:
            repetition = repetition +1
            print("Bot :%s" %(row[2]))
        if repetition!=0:
            boolean = True
        else:
            boolean = False
	#Ici on va prendre de la table chanson le nom du chanteur entrer par l utilisateur
    QueryCurs.execute('''SELECT * FROM chanteur''')
    rows = QueryCurs.fetchall()
    for row in rows:
        if question==row[1]:
            print("Bot :Le nom du chanteur trouve veuillez continuer pour plus d'information")				
            id_artiste=row[0]
            repetition = repetition + 1
            boolean=True
        else:
            boolean=False
	#Ici on va prendre de la table chanson le nom du chanson entrer par l utilisateur
    QueryCurs.execute('''SELECT * FROM chanson''')
    rows = QueryCurs.fetchall()
    for row in rows:
        if question==row[1]:
            print("Bot :Le nom du titre trouve veuillez continuer pour plus d'information")				
            id_lyrics=row[0]
            repetition = repetition + 1
            boolean=True
        else:
            boolean=False	
    if id_artiste!="":
	#Ici on va commencer la recherche à l'aide des 2 infos du chanson et chanteur recu et afficher
        QueryCurs.execute('''SELECT nom_artiste as chanteur,homme as masculine,nom_album as
        album,parole,nom_type as type_chanson,annee_sortie
         FROM chanson
        LEFT JOIN chanteur ON chanson.chanteur_principal = chanteur.id_chanteur
        LEFT JOIN album ON chanson.numero_album = album.id_album
        LEFT JOIN type ON chanson.numero_categorie = type.id_type
        WHERE id_chanteur= "%s" AND id_chanson= "%s"'''%(id_artiste,id_lyrics))#requete sql avec des cles entre plusieur tables
        rows = QueryCurs.fetchall()
        for row in rows:
            print("Resultat trouve veuillez entrez votre choix\n")
            print("1-pour voir tous les infos present\n")
            print("2-pour juste voir les paroles\n")
            print("3-pour juste voir tout sauf les paroles\n")
            choix=int(input("Votre choix?\n"))
            if(choix==1):#premier choix pour voir tout les infos
                print("Artiste:%s"%(row[0]))
                print("Homme(bool):%s"%(row[1]))
                print("Album:%s"%(row[2]))
                print("Parole:%s"%(row[3]))
                print("Categorie:%s"%(row[4]))            
                print("Annee de sortie:%s"%(row[5]))            
            elif(choix==2):#choix 2 pour voir parole seulement
                print("Parole:%s"%(row[3]))        
            else:#autre choix pour voir tout sauf parole
                print("Artiste:%s"%(row[0]))
                print("Homme(bool):%s"%(row[1]))
                print("Album:%s"%(row[2]))
                print("Categorie:%s"%(row[4]))
            id_artiste=""
            boolean=True
    if boolean==False and repetition==0:#Si bot ne sait pas la question poser par utilisateur
        reponsebot = random.choice(reponseidkbot)#variable pour reponse aleatoire si bot n a pas la reponse
        liste=[question]
        bool=parcourscompa_table_repetition_conversation(liste[0])#boolean pour verif repetition
        if bool==False:
            QueryCurs.execute('''INSERT INTO conversation (Question)
            VALUES ("%s")'''%(liste[0]))	#Inserer dans la bdd si au cas ou le bot n a pas la reponse
            CreateDataBase.commit()
            QueryCurs.close()
            print("Bot :"+reponsebot)#Reponse aleatoire du bot ou on choisis de faire au debut
        else:
            print("Bot :"+reponsebot)#Reponse aleatoire du bot ou on choisis de faire au debut    
print('Bot: ' + Botrevoir)#message d'au revoir par le bot

user_input.bind("<Return>", cb)#ca fait un sortir du chatbot
output = tk.Label(root, printf='')#la ou on va saisir permettre tkinter puisse afficher ce que tu saisie
output.pack()#sortir du label

tk.mainloop()#la fin du code de tkinter





