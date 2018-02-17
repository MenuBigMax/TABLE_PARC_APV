 	TABLE PARC APRES-VENTE
======================

Objectif
---------

### A partir des tables suivantes (clefs primaires cochées) :

* nomenclature
	- [x] CDGAM	: code gamme
	- [x] NUMFE	: fonction élémentaire
	- [x] CDVAR	: code variante
	- [ ] MTCFIX	: Mise en Titre Critère fixe
	- [ ] MTCVAR	: Mise en Titre Critère variable
* critere
	- [x] CDOBJ	: Code objet
	- [x] CRIT	: critère
* bvm_brut
	- [x] VIN	: Vehicle Identification Number (utilisés depuis 1954 pour identifier chaque véhicule automobile)
	- [ ] CDGAM	: Code gamme
	- [ ] 002	: Critère 002
	- [ ] 003	: Critère 003
	- [ ] ...	: ...
* veh_manu_CDGAM-YEAR
	- [X] CDGAM	: Code gamme
	- [X] YEAR	: Année
	- [ ] NB_VEH_MANUFACTURED	: Nombre d'exemplaires fabriqués

Les données de ces tables ont été totalement créées pour la recette des algorithmes. Elles ne peuvent pas être considérées comme reflètant une réalité.

### Construire la table suivante :

* parc_apv
	- [x] CDGAM
	- [x] NUMFE
	- [x] CDVAR
	- [x] DTCALC	: date des quantités calculées
	- [ ] QTCOM	: nombre de véhicules commercialisés 
	- [ ] QTFAB	: nombre de véhicules fabriqués
	- [ ] QTFACT	: nombre de véhicules facturés
	- [ ] QT1IMMAT	: nombre de véhicules immatriculés pour la première fois
	- [ ] QTLIVR 	: nombre de véhicules livrés au client
	- [ ] ...

