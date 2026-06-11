przepisy_w_miarach_kuchennych <- data.frame(
  przepis = c(
    "ciasto_kakaowe", "ciasto_kakaowe", "ciasto_kakaowe", "ciasto_kakaowe", "ciasto_kakaowe",
    "owsianka_kakaowa", "owsianka_kakaowa", "owsianka_kakaowa", "owsianka_kakaowa", "owsianka_kakaowa"
  ),
  porcje = c(
    8, 8, 8, 8, 8,
    2, 2, 2, 2, 2
  ),
  skladnik = c(
    "maka", "cukier", "mleko", "olej", "kakao",
    "platki_owsiane", "mleko", "kakao", "cukier", "maslo"
  ),
  ilosc = c(
    2, 1, 1, 0.5, 3,
    1, 2, 1, 2, 1
  ),
  jednostka = c(
    "szklanka", "szklanka", "szklanka", "szklanka", "lyzka",
    "szklanka", "szklanka", "lyzka", "lyzeczka", "lyzeczka"
  ),
  stringsAsFactors = FALSE
)

# Zapisujemy dane do pakietu
usethis::use_data(przepisy_w_miarach_kuchennych, overwrite = TRUE)
