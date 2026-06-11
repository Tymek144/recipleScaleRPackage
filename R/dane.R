#' Przykladowe przepisy kulinarne
#'
#' Zbior danych zawiera przykladowe przepisy kulinarne wraz z lista skladnikow,
#' liczba porcji, iloscia skladnika oraz jednostka miary.
#'
#' Dane sluza do pokazania dzialania funkcji `skaluj_przepis()` oraz
#' `przelicz_miare()` dostepnych w pakiecie `recipleScaleR`.
#'
#' @format Ramka danych zawierajaca 8 obserwacji i 5 zmiennych:
#' \describe{
#'   \item{przepis}{Nazwa przepisu.}
#'   \item{porcje}{Liczba porcji w przepisie bazowym.}
#'   \item{skladnik}{Nazwa skladnika.}
#'   \item{ilosc}{Ilosc danego skladnika.}
#'   \item{jednostka}{Jednostka miary skladnika.}
#' }
#'
#' @examples
#' przepisy_przykladowe
#'
"przepisy_przykladowe"


#' Przepisy zapisane w miarach kuchennych
#'
#' Zbior danych zawiera przykladowe przepisy kulinarne, w ktorych skladniki
#' zapisane sa w miarach kuchennych, takich jak szklanka, lyzka i lyzeczka.
#'
#' Dane sluza do pokazania dzialania funkcji `przelicz_na_gramy()`,
#' ktora przelicza miary kuchenne na gramy.
#'
#' @format Ramka danych zawierajaca informacje o przepisach:
#' \describe{
#'   \item{przepis}{Nazwa przepisu.}
#'   \item{porcje}{Liczba porcji w przepisie bazowym.}
#'   \item{skladnik}{Nazwa skladnika.}
#'   \item{ilosc}{Ilosc danego skladnika.}
#'   \item{jednostka}{Jednostka miary skladnika.}
#' }
#'
#' @examples
#' przepisy_w_miarach_kuchennych
#'
"przepisy_w_miarach_kuchennych"
