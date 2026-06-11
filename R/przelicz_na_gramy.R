#' Przeliczanie miar kuchennych na gramy
#'
#' Funkcja przelicza miary kuchenne, takie jak szklanki, łyżki i łyżeczki,
#' na gramy dla wybranego produktu. Przeliczenia są przybliżone, ponieważ
#' waga jednej szklanki lub łyżki zależy od rodzaju produktu.
#'
#' @param produkt Nazwa produktu, np. "maka", "cukier", "maslo", "mleko" albo "olej".
#' @param ilosc Liczba jednostek, np. 2 szklanki albo 3 lyzki.
#' @param jednostka Jednostka miary. Mozliwe wartosci: "szklanka", "lyzka", "lyzeczka".
#'
#' @return Ramka danych z przeliczona wartoscia w gramach.
#'
#' @examples
#' przelicz_na_gramy("maka", 2, "szklanka")
#' przelicz_na_gramy("cukier", 3, "lyzka")
#' przelicz_na_gramy("maslo", 2, "lyzeczka")
#'
#' @export
przelicz_na_gramy <- function(produkt, ilosc, jednostka = "szklanka") {

  przeliczniki <- data.frame(
    produkt = c("maka", "cukier", "maslo", "mleko", "olej"),
    gram_na_szklanke = c(160, 220, 240, 250, 230),
    gram_na_lyzke = c(10, 13, 15, 15, 14),
    gram_na_lyzeczke = c(3, 4, 5, 5, 4.5)
  )

  produkt <- tolower(produkt)
  jednostka <- tolower(jednostka)

  if (!produkt %in% przeliczniki$produkt) {
    stop("Nie ma takiego produktu w bazie przelicznikow.")
  }

  if (ilosc <= 0) {
    stop("Argument 'ilosc' musi byc wiekszy od zera.")
  }

  if (!jednostka %in% c("szklanka", "lyzka", "lyzeczka")) {
    stop("Jednostka musi miec wartosc: 'szklanka', 'lyzka' albo 'lyzeczka'.")
  }

  wiersz <- przeliczniki[przeliczniki$produkt == produkt, ]

  if (jednostka == "szklanka") {
    gramy <- ilosc * wiersz$gram_na_szklanke
  }

  if (jednostka == "lyzka") {
    gramy <- ilosc * wiersz$gram_na_lyzke
  }

  if (jednostka == "lyzeczka") {
    gramy <- ilosc * wiersz$gram_na_lyzeczke
  }

  gramy <- round(gramy, 2)

  wynik <- data.frame(
    produkt = produkt,
    ilosc = ilosc,
    jednostka = jednostka,
    gramy = gramy
  )

  return(wynik)
}
