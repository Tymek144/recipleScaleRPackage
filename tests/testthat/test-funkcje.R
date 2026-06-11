test_that("skaluj_przepis poprawnie skaluje przepis na wieksza liczbe porcji", {

  przepis <- data.frame(
    skladnik = c("maka", "cukier", "mleko"),
    ilosc = c(200, 100, 300),
    jednostka = c("g", "g", "ml")
  )

  wynik <- skaluj_przepis(
    dane = przepis,
    porcje_bazowe = 2,
    porcje_docelowe = 4
  )

  expect_equal(wynik$ilosc_po_przeliczeniu, c(400, 200, 600))
})


test_that("skaluj_przepis poprawnie skaluje przepis na mniejsza liczbe porcji", {

  przepis <- data.frame(
    skladnik = c("maka", "cukier"),
    ilosc = c(400, 200),
    jednostka = c("g", "g")
  )

  wynik <- skaluj_przepis(
    dane = przepis,
    porcje_bazowe = 4,
    porcje_docelowe = 2
  )

  expect_equal(wynik$ilosc_po_przeliczeniu, c(200, 100))
})


test_that("skaluj_przepis zwraca blad, gdy dane nie sa ramka danych", {

  expect_error(
    skaluj_przepis(
      dane = c(100, 200, 300),
      porcje_bazowe = 2,
      porcje_docelowe = 4
    )
  )
})


test_that("skaluj_przepis zwraca blad, gdy brakuje kolumny ilosc", {

  przepis <- data.frame(
    skladnik = c("maka", "cukier"),
    jednostka = c("g", "g")
  )

  expect_error(
    skaluj_przepis(
      dane = przepis,
      porcje_bazowe = 2,
      porcje_docelowe = 4
    )
  )
})


test_that("skaluj_przepis zwraca blad dla niepoprawnej liczby porcji", {

  przepis <- data.frame(
    skladnik = "maka",
    ilosc = 200,
    jednostka = "g"
  )

  expect_error(
    skaluj_przepis(
      dane = przepis,
      porcje_bazowe = 0,
      porcje_docelowe = 4
    )
  )
})


test_that("przelicz_miare poprawnie przelicza gramy na szklanki", {

  wynik <- przelicz_miare(
    produkt = "maka",
    gramy = 320,
    jednostka_docelowa = "szklanka"
  )

  expect_equal(wynik$wynik, 2)
})


test_that("przelicz_miare poprawnie przelicza gramy na lyzki", {

  wynik <- przelicz_miare(
    produkt = "cukier",
    gramy = 26,
    jednostka_docelowa = "lyzka"
  )

  expect_equal(wynik$wynik, 2)
})


test_that("przelicz_miare poprawnie przelicza gramy na lyzeczki", {

  wynik <- przelicz_miare(
    produkt = "maslo",
    gramy = 10,
    jednostka_docelowa = "lyzeczka"
  )

  expect_equal(wynik$wynik, 2)
})


test_that("przelicz_miare zwraca blad dla nieznanego produktu", {

  expect_error(
    przelicz_miare(
      produkt = "ser",
      gramy = 100,
      jednostka_docelowa = "szklanka"
    )
  )
})


test_that("przelicz_miare zwraca blad dla niepoprawnej jednostki", {

  expect_error(
    przelicz_miare(
      produkt = "maka",
      gramy = 100,
      jednostka_docelowa = "kilogram"
    )
  )
})


test_that("przelicz_miare zwraca blad dla ujemnej liczby gramow", {

  expect_error(
    przelicz_miare(
      produkt = "maka",
      gramy = -100,
      jednostka_docelowa = "szklanka"
    )
  )
})


test_that("przelicz_na_gramy poprawnie przelicza szklanki na gramy", {

  wynik <- przelicz_na_gramy(
    produkt = "maka",
    ilosc = 2,
    jednostka = "szklanka"
  )

  expect_equal(wynik$gramy, 320)
})


test_that("przelicz_na_gramy poprawnie przelicza lyzki na gramy", {

  wynik <- przelicz_na_gramy(
    produkt = "kakao",
    ilosc = 3,
    jednostka = "lyzka"
  )

  expect_equal(wynik$gramy, 24)
})


test_that("przelicz_na_gramy poprawnie przelicza lyzeczki na gramy", {

  wynik <- przelicz_na_gramy(
    produkt = "cukier",
    ilosc = 2,
    jednostka = "lyzeczka"
  )

  expect_equal(wynik$gramy, 8)
})


  test_that("przelicz_na_gramy poprawnie przelicza platki owsiane", {

    wynik <- przelicz_na_gramy(
      produkt = "platki_owsiane",
      ilosc = 1,
      jednostka = "szklanka"
    )

    expect_equal(wynik$gramy, 110)
  })


  test_that("przelicz_na_gramy zwraca blad dla nieznanego produktu", {

    expect_error(
      przelicz_na_gramy(
        produkt = "ser",
        ilosc = 2,
        jednostka = "szklanka"
      )
    )
  })


  test_that("przelicz_na_gramy zwraca blad dla niepoprawnej jednostki", {

    expect_error(
      przelicz_na_gramy(
        produkt = "maka",
        ilosc = 2,
        jednostka = "kilogram"
      )
    )
  })


  test_that("przelicz_na_gramy zwraca blad dla ujemnej ilosci", {

    expect_error(
      przelicz_na_gramy(
        produkt = "maka",
        ilosc = -2,
        jednostka = "szklanka"
      )
    )
  })
