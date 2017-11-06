# Syntaxe (V2)

## Eléments de syntaxe :

ci dessous, `xmlns:g="http://jimetevenard.com/ns/generate-xsl"`

Elément            | Attributs  | Role                                                               | Traité
-------------------|------------|--------------------------------------------------------------------|---------
g:remove           |            |Supprimer un éléménet                                               | Oui
                   | @id        |Identifier un élément par son @g:id                                 | OUI
                   | @name      |Identifier un template par son @name                                | OUI
g:use-import       |            |Utiliser un import pendant la génération                            | ?
                   | @href      |@href à utiliser. **attention aux chemins relatifs**                | OUI
                   | @id        |@g:id d'un import existant. **attention aux chemins relatifs**      | ?
                   | @remove    |dans le cas d'un import existant, le supprimer dans la XSL finale   | ?
g:use-variable     |            |Déclarer une variable qui vit pendant le process de génération      | Oui
                   | @name      |       ...                                                          | Oui
                   | @select    |     ... *Si absent, séquence construite*                           | ?
g:variable         |            |Déclarer une variable dans la *XSL générée*                         | Oui
                   | @name      |       ...                                                          | Oui
                   | @select    |       ... *Si absent, séquence construite*                         | Oui
                   | @evaluate  |*Cf. Paragraphe sur le statut des variables*                        | Oui

g:redefine-variable|            |



g:use-variable     |            |BUT| Oui
                   | @toto |BUT| Oui


## WIP : XPAth base.xsl

### Elements

* generate:remove
* generate:use-import
* generate:use-variable
* generate:for-each
* generate:copy-template
* generate:set-match
* generate:redefine-variable
* generate:variable

### Atributs

* generate:remove/@id
* generate:use-import/@href
* generate:use-variable/@name
* generate:use-variable/@select
* generate:for-each/@name
* generate:for-each/@select
* generate:copy-template/@keep-original
* generate:copy-template/@name
* generate:set-match/@value
* generate:redefine-variable/@evaluate
* generate:redefine-variable/@name
* generate:redefine-variable/@select
* generate:variable/@evaluate
* generate:variable/@name
* generate:variable/@select
