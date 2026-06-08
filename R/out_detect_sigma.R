#' Detekcja wartości odstających
#'
#' Funkcja wyznaczająca wartości odstające zgodnie z reguła k sigm
#'
#' @usage out_detect_sigma(x, k = 3)
#'
#' @param x Wektor liczbowy
#' @param k Wartość liczbowa dodatnia, definiująca regułę k sigm
#'
#' @returns Funkcja zwraca wektor z wartościami odstającymi
#'
#' @examples
#' set.seed(1234)
#' x <- rt(100, 1)
#' out_detect_sigma(x, k = 2)
#'
#' @export

out_detect_sigma <-
function(x, k = 3) {

  avg <- mean(x)
  s <- sd(x)

  x[(x < avg - k*s) | (x > avg + k*s)]
}
