# Generate XSL

Generate-XSL est un langage d'annotions permettant de décrire la compilation d'une transformation XSL, en pré-calculant certaines évaluations dans un but d'optimisation des performances.

Ces annotations s'expriment sous forme d'éléments et d'attributs XML appartenant au namespace Generate-XSL ajoutés dans la transformation XSL.

Après compilation, on obtient une XSLT générée dans laquelle la valeur des variables, le résultat des appels de fonction, des appels de templates ou des structures de boucles et conditions annoté(e)s sont sérialisés.

L'objectif principal de ce système d'annotation est d'optimiser le traitement d'une XSLT sans affecter son fonctionnement d'origine.
Ainsi cette XSLT reste maintenable et testable, et des test comparés de la XSL source et de la XSL générée permettent d'identifier facilement les éventuels effets de bord de la compilation

[Documentation détaillée](http://jimetevenard.github.io/generate-xsl/)
