#' Przeliczanie liczby porcji
#'
#' Funkcja przelicza ilosc skladnikow z przepisu bazowego na podana liczbe porcji,
#' np. przepis na 4 porcje, a uzytkownik moze przeliczyc go na
#' 8 porcji. Dzieki funkcji ilosc kazdego skladnika zostanie podwojona.
#'
#' Dane wejsciowe powinny byc ramka danych zawierajaca kolumne
#' `ilosc`, w ktorej znajduja sie ilosci skladnikow.
#'
#' @param dane Ramka danych ze skladnikami przepisu.
#' @param porcje_bazowe Liczba porcji w przepisie bazowym.
#' @param porcje_docelowe Liczba porcji, ktora chcemy otrzymac.
#'
#' @return Ramka danych z dodatkowa kolumna `ilosc_po_przeliczeniu`.
#'
#' @examples
#' przepis <- data.frame(
#'   skladnik = c("maka", "cukier", "jajka"),
#'   ilosc = c(300, 100, 2),
#'   jednostka = c("g", "g", "szt.")
#' )
#'
#' skaluj_przepis(przepis, porcje_bazowe = 4, porcje_docelowe = 8)
#'
#' @export
skaluj_przepis <- function(dane, porcje_bazowe, porcje_docelowe) {

  if (!is.data.frame(dane)) {
    stop("Argument 'dane' musi byc ramka danych.")
  }

  if (!"ilosc" %in% names(dane)) {
    stop("W danych musi znajdowac sie kolumna 'ilosc'.")
  }

  if (porcje_bazowe <= 0) {
    stop("Argument 'porcje_bazowe' musi byc wiekszy od zera.")
  }

  if (porcje_docelowe <= 0) {
    stop("Argument 'porcje_docelowe' musi byc wiekszy od zera.")
  }

  przelicznik <- porcje_docelowe / porcje_bazowe

  dane$ilosc_po_przeliczeniu <- dane$ilosc * przelicznik

  return(dane)
}
