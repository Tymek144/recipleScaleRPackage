#' Przedstawianie za pomocą miar kuchennych ilości gramów
#'
#' funkcja pomaga przedstawić za pomocą podstawowych miar kuchennych konkretną
#' ilość gramów w przypadku braku wagi kuchennej.
#' Funkcja przelicza podaną liczbę gramów na wybraną miarę kuchenną:
#' szklanki, łyżki albo łyżeczki. Przeliczenia są przybliżone.
#'
#' @param produkt Nazwa produktu, np. "maka", "cukier", "maslo", "mleko" albo "olej".
#' @param gramy Liczba gramow produktu.
#' @param jednostka_docelowa Jednostka, na ktora chcemy przeliczyc gramy.
#' Mozliwe wartosci: "szklanka", "lyzka", "lyzeczka".
#'
#' @return Ramka danych z wynikiem przeliczenia.
#'
#' @examples
#' przelicz_miare("maka", 320, "szklanka")
#' przelicz_miare("cukier", 26, "lyzka")
#' przelicz_miare("maslo", 10, "lyzeczka")
#'
#' @export
przelicz_miare <- function(produkt, gramy, jednostka_docelowa = "szklanka") {

  przeliczniki <- data.frame(
    produkt = c("maka", "cukier", "maslo", "mleko", "olej"),
    gram_na_szklanke = c(160, 220, 240, 250, 230),
    gram_na_lyzke = c(10, 13, 15, 15, 14),
    gram_na_lyzeczke = c(3, 4, 5, 5, 4.5)
  )

  produkt <- tolower(produkt)

  if (!produkt %in% przeliczniki$produkt) {
    stop("Nie ma takiego produktu w bazie przelicznikow.")
  }

  if (gramy <= 0) {
    stop("Liczba gramow musi byc wieksza od zera.")
  }

  if (!jednostka_docelowa %in% c("szklanka", "lyzka", "lyzeczka")) {
    stop("Jednostka docelowa musi miec wartosc: 'szklanka', 'lyzka' albo 'lyzeczka'.")
  }

  wiersz <- przeliczniki[przeliczniki$produkt == produkt, ]

  if (jednostka_docelowa == "szklanka") {
    wynik <- gramy / wiersz$gram_na_szklanke
  }

  if (jednostka_docelowa == "lyzka") {
    wynik <- gramy / wiersz$gram_na_lyzke
  }

  if (jednostka_docelowa == "lyzeczka") {
    wynik <- gramy / wiersz$gram_na_lyzeczke
  }

  wynik <- round(wynik, 2)

  return(data.frame(
    produkt = produkt,
    gramy = gramy,
    jednostka_docelowa = jednostka_docelowa,
    wynik = wynik
  ))
}
