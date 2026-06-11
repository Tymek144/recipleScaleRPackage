#' Przeliczanie liczby porcji
#'
#' Funkcja przelicza ilosc składnikow z przepisu bazowego na podaną liczbę porcji,
#' np. przepis na 4 porcje, a użytkownik możę przeliczyc na
#' 8 porcji, dzieki funkcji, która podwoi ilosc kazdego skladnika.
#'
#' Dane wejsciowe powinny byc ramka danych zawierajaca kolumne
#' ilosc, w ktorej znajduja sie ilosci skladnikow.
#'
#' @param dane Ramka danych ze skladnikami przepisu.
#' @param porcje_bazowe Liczba porcji w przepisie bazowym.
#' @param porcje_docelowe Liczba porcji, którą chcemy otrzymac.
#'
#' @return Ramka danych z dodatkowa kolumna ilosc_po_przeliczeniu.
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
    stop("Argument 'dane' musi być ramką danych.")
  }

  if (!"ilosc" %in% names(dane)) {
    stop("W danych musi znajdować się kolumna 'ilosc'.")
  }

  if (porcje_bazowe <= 0) {
    stop("Argument 'porcje_bazowe' musi być większy od zera.")
  }

  if (porcje_docelowe <= 0) {
    stop("Argument 'porcje_docelowe' musi być większy od zera.")
  }

  przelicznik <- porcje_docelowe / porcje_bazowe

  dane$ilosc_po_przeliczeniu <- dane$ilosc * przelicznik

  return(dane)
}
