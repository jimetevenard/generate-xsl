NOTES
======

Placer les nouvelles notes sous cette ligne


Structure de la doc des langNodes
=================================

* Compiler des instructions XSLT
* * Compiler une instruction par l'ajout de l'att g:build
* * Dupliquer un template avec l'elt g:copy-template
* * * Modifier les templace avec les elts g:set-match, g:set-mode, g:set-priority, g:set-name, g:set-as, g:set-visibility, g:redefine-variable et g:with-param

* Elements de structure du langage d'annotations
* * Generer des variables (globales?(copy-template?)) avec l'elt g:variable
* * Redefinir une variable existante avec g:redefine-variable
* * Générer des imports avec l'elt g:import
* * Générer des parms globaux avec l'elt g:param
* * Ajouter un bloc de code avec l'elt g:target-block
* * Structures de controle : elts g:if, g:for-each et g:choose

* Utiliser des variables et paramètres dans le contexte de génération
* * l'attribut g:use
* * les elts g:use-variable, g:use-import et g:use-param

* Identifier une instruction xsl
* * Ajout d'un identifiant par l'attribut g:id