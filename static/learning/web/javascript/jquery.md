# JQuery

## Approccio

scrivi di meno, fai di piu'

lo scopo e' di rendere piu' facile l'uso di javascript nelle pagine web

jquery avvolge le numerose chiamate di alcune implementazioni standardizzate dentro a funzioni che sono piu' comode da usare (perche' molto piu' brevi da scrivere)

esempi:
- manipolazione HTML/DOM
- manipolazione CSS
- gestione eventi HTML
- effetti e animazioni
- AJAX
- utilities ?

## Cosa e'

e' una libreria, contenuta in un singolo file `.js`

si include in `<head>` in ogni pagina HTML dove serve

## Come funziona

si usano le funzioni di jquery per selezionare elementi HTML e farci operazioni

## Sintassi

`$`: serve per accedere le funzioni di jquery
`(name_here)`: e' un selettore per selezionare elementi HTML
`action()`: e' una funzione che opera sui dati argomenti

esempi:
- `$(this).hide()`: nasconde l'elemento corrente
- `$("p").hide()`: nasconde tutti gli elementi `<p>`
- `$(".test").hide()`: nasconde tutti gli elementi con classe `test`
- `$("#test").hide()`: nasconde tutti gli elementi con id `test`



## Good Practices

- aspetta che il documento HTML sia completamente caricato prima di modificarlo

