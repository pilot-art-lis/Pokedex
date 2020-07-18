# Pokédex 1

### Źródło API

Wykorzystamy do tego api Switter. Dokumentacja jest dostępna [tutaj](https://github.com/DaftMobile/switter).

>Samo API jest dostępne pod adresem [https://switter.app.daftmobile.com](https://switter.app.daftmobile.com).

---

#### Pobieranie

Główną funkcjonalnością aplikacji jest zmienianie aktualnie wybranego Pokémona przy pomocy tapnięcia. Aplikacja wykorzystuje Auto Layout. Kolory aplikacji zmieniają się w zależności od aktualnie wybranego Pokémona.

#### Fetch

1. Wchodząc do aplikacji mamy jedynie numer aktualnego Pokémona (1).
2. Tapnięcie powoduje **pobranie** Pokémona o powiększonym o 1 numerze.
3. Tapnięcie dwoma palcami powoduje **pobranie** Pokémona o pomniejszonym o 1 numerze.

#### Catch

Swipe up powoduje (obviously 💁‍♀️) rzut Pokeballem i złapanie Pokémona przy pomocy calla HTTP do metody `catch` (a konkretnie `/pokemon/:number/catch`). Po złapaniu Pokémona widok się odświeża (przy pomocy danych zwróconych z `catch`) oraz pobierany jest nowy obrazek (który powinien być już kolorowy).

>Użyjcie `UISwipeGestureRecognizer`.

#### Download Progress

W czasie pobierania nowego Pokémona, oraz w czasie pobierania obrazka użytkownik jasno widzi, że aplikacja coś robi. Użyty do tego jest `UIActivityIndicator`.

Poniżej screenshoty z gotowej aplikacji.

![Screenshot1](assets/s1.png)
![Screenshot2](assets/s2.png)
![Screenshot3](assets/s3.png)
![Screenshot4](assets/s4.png)

### Wskazówki

[Dokumentacja](https://github.com/DaftMobile/switter) jest super żeby wiedzieć jak działają endpointy
