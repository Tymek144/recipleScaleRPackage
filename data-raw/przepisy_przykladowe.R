przepisy_przykladowe <- data.frame(
  przepis = c(
    "naleśniki", "naleśniki", "naleśniki", "naleśniki",
    "ciasto", "ciasto", "ciasto", "ciasto"
  ),
  porcje = c(
    4, 4, 4, 4,
    8, 8, 8, 8
  ),
  skladnik = c(
    "maka", "mleko", "jajka", "olej",
    "maka", "cukier", "maslo", "jajka"
  ),
  ilosc = c(
    250, 500, 2, 30,
    300, 150, 100, 3
  ),
  jednostka = c(
    "g", "ml", "szt.", "ml",
    "g", "g", "g", "szt."
  ),
  stringsAsFactors = FALSE
)

# Zapisujemy dane do pakietu
usethis::use_data(przepisy_przykladowe, overwrite = TRUE)

