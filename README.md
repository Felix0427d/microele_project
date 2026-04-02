# Mini Light Up Game - Multi-Digit Edition

## 1. Présentation du Projet
[cite_start]Le **Mini Light Up Game** est un jeu électronique de précision conçu pour l'architecture **TinyTapeout**[cite: 3, 4]. [cite_start]L'objectif est de permettre au joueur d'allumer les segments d'un afficheur 7 segments afin de former le chiffre **0**[cite: 4, 9]. 

[cite_start]Le système repose sur un **curseur rotatif automatique** que le joueur doit "bloquer" au bon moment à l'aide d'un bouton à impulsion[cite: 7, 8].

### Évolution Technique
Initialement conçu pour un seul afficheur, le projet a été étendu à un système de **4 afficheurs 7 segments multiplexés**. Cette modification permet d'augmenter la complexité technique tout en optimisant l'utilisation des broches de sortie (I/O) de la puce.

---

## 2. Architecture du Système
L'architecture logicielle et matérielle est divisée en quatre blocs principaux :

### 2.1 Registre Circulaire (Curseur)
* [cite_start]**Structure** : Un registre de 6 bits composé de **bascules D**[cite: 12, 14].
* [cite_start]**Fonctionnement** : Un bit unique circule entre chaque base et recommence son cycle lorsqu'il atteint la dernière position[cite: 13].

### 2.2 Interface Utilisateur
* [cite_start]**Entrée** : Un bouton d'entrée génère un signal lors d'une pression[cite: 18].
* [cite_start]**Traitement** : Le signal est traité par des **portes logiques** pour garantir une impulsion unique par appui et éviter les rebonds (anti-rebond)[cite: 19].
* [cite_start]**Synchronisation** : L'impulsion est synchronisée à l'aide de bascules D avant d'être envoyée en mémoire[cite: 20].

### 2.3 Unité de Mémoire
* [cite_start]**Stockage** : Chaque segment est associé à une bascule permettant la mise en mémoire d'une valeur binaire[cite: 22].
* [cite_start]**Logique** : La valeur à l'entrée est une combinaison de la position du curseur, du signal joueur et de la valeur précédente[cite: 23].
* [cite_start]**Rétention** : Une boucle de rétroaction permet de conserver la valeur lorsqu'aucune écriture n'est effectuée[cite: 24].

### 2.4 Affichage Multiplexé
* [cite_start]**Logique Combinatoire** : Les données en mémoire sont traitées pour alimenter l'ensemble des segments[cite: 26].
* [cite_start]**Multiplexage** : Le système utilise un bus commun pour les segments et alterne l'activation des 4 afficheurs à haute fréquence (scanning) pour une perception visuelle continue[cite: 27].

---

## 3. Spécifications Techniques
* [cite_start]**Designers** : Pierre Louis (23317) & de Crouy Chanel Félix (22176) [cite: 2]
* [cite_start]**Date** : Mars 2026 [cite: 2]
* **Cible** : ASIC (via LibreLane / TinyTapeout)
* **Langage** : Verilog HDL

---

## 4. Simulation et Utilisation
Le projet est conçu pour être testé dans l'environnement **LibreLane**.

### Simulation Fonctionnelle
Pour lancer le testbench et vérifier le comportement du multiplexage :
```bash
nix-shell
make sim
gtkwave dump.vcd
