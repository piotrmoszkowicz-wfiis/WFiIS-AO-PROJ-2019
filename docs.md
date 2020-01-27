% Dokumentacja projektu na przedmiot Analiza Obrazów
% Moszkowicz Piotr, Oziomek Krzysztof
% 2019/2020

## Opis projektu TODO
Lorem ipsum

## Narzędzia potrzebne do uruchomienia projektu
- MATLAB (R2019a lub nowszy)
- uruchomienie skryptu `proj.m`

## Co projekt robi?
Po uruchomieniu z katalogu `images` oraz jego podkatalogów zostają odczytane pliki graficzne, które nastepnie są poddawane obróbce. Polega ona na modyfikacji jasności, kontrastu oraz gammy, a jej etapy zdefiniowane są w pliku `preprocess.m`. Nastepnie, na obrazach wynikowych trenowana jest sztuczna sieć neuronowa.

## Co nie działa?
- Dokładność klasyfikacji zrzutów ekranu jest na bardzo niskim poziomie. Spowodowane jest to małą ilością danych treningowych.

## Wykonane elementy
- Piotr Moszkowicz:
	- odczyt danych
	- projekt sieci neuronowej
- Krszysztof Oziomek:
	- obróbka danych wejściowych
	- dokumentacja