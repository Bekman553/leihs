# language: de

Funktionalität: Gegenstand erstellen

  @javascript
  Szenario: Wo man einen Gegenstand erstellen kann
    Angenommen Personas existieren
    Und man ist "Matti"
    Und man befindet sich auf der Liste des Inventars
    Dann kann man einen Gegenstand erstellen

  @javascript
  Szenario: Felder beim Erstellen eines Gegenstandes
    Angenommen Personas existieren
    Und man ist "Matti"
    Und man navigiert zur Gegenstandserstellungsseite
    Und I check "Ausgemustert"
    Und I choose "Investition"
    Dann sehe ich die Felder in folgender Reihenfolge:
    | Inventarcode                 |
    | Modell                       |
    | - Zustand -                  |
    | Ausmusterung                 |
    | Grund der Ausmusterung       |
    | Zustand                      |
    | Vollständigkeit              |
    | Ausleihbar                   |
    | - Inventar -                 |
    | Inventarrelevant             |
    | Anschaffungskategorie        |    
    | Besitzer                     |
    | Letzte Inventur              |
    | Verantwortliche Abteilung    |
    | Verantwortliche Person       |
    | Benutzer/Verwendung          |
    | - Umzug -                    |
    | Umzug                        |
    | Zielraum                     |
    | - Toni Ankunftskontrolle -   |
    | Ankunftsdatum                |
    | Ankunftszustand              |
    | Ankunftsnotiz                |
    | - Allgemeine Informationen - |
    | Seriennummer                 |
    | MAC-Adresse                  |
    | IMEI-Nummer                  |
    | Name                         |
    | Notiz                        |
    | - Ort -                      |
    | Gebäude                      |
    | Raum                         |
    | Gestell                      |
    | - Rechnungsinformationen -   |
    | Bezug                        |
    | Projektnummer                |
    | Rechnungsnummer              |
    | Rechnungsdatum               |
    | Anschaffungswert             |
    | Lieferant                    |
    | Garantieablaufdatum          |
    | Vertragsablaufdatum          |

  @javascript
  Szenario: Einen Gegenstand mit allen Informationen erstellen
    Angenommen Personas existieren
    Und man ist "Matti"
    Und man navigiert zur Gegenstandserstellungsseite
    Wenn ich die folgenden Informationen erfasse
    | Feldname                     | Type         | Wert                          |

    | Inventarcode                 |              | Test Inventory Code           |
    | Modell                       | autocomplete | Sharp Beamer                  |

    | Ausmusterung                 | checkbox     | unchecked                     |
    | Zustand                      | radio        | OK                            |
    | Vollständigkeit              | radio        | OK                            |
    | Ausleihbar                   | radio        | OK                            |

    | Inventarrelevant             | select       | Ja                            |
    | Anschaffungskategorie        | select       | Werkstatt-Technik             | 
    | Letzte Inventur              |              | 01.01.2013                    |
    | Verantwortliche Abteilung    | autocomplete | A-Ausleihe                    |
    | Verantwortliche Person       |              | Matus Kmit                    |
    | Benutzer/Verwendung          |              | Test Verwendung               |

    | Umzug                        | select       | sofort entsorgen              |
    | Zielraum                     |              | Test Raum                     |

    | Ankunftsdatum                |              | 01.01.2013                    |
    | Ankunftszustand              | select       | transportschaden              |
    | Ankunftsnotiz                |              | Test Notiz                    |

    | Seriennummer                 |              | Test Seriennummer             |
    | MAC-Adresse                  |              | Test MAC-Adresse              |
    | IMEI-Nummer                  |              | Test IMEI-Nummer              |
    | Name                         |              | Test Name                     |
    | Notiz                        |              | Test Notiz                    |

    | Gebäude                      | autocomplete | Keine/r                       |
    | Raum                         |              | Test Raum                     |
    | Gestell                      |              | Test Gestell                  |

    | Bezug                        | radio must   | investment                    |
    | Projektnummer                |              | Test Nummer                   |
    | Rechnungsnummer              |              | Test Nummer                   |
    | Rechnungsdatum               |              | 01.01.2013                    |
    | Anschaffungswert             |              | 50.0                          |
    | Lieferant                    | autocomplete | Keine/r                       |
    | Garantieablaufdatum          |              | 01.01.2013                    |
    | Vertragsablaufdatum          |              | 01.01.2013                    |

    Und ich erstellen druecke
    Dann man wird zur Liste des Inventars zurueckgefuehrt
    Und ist der Gegenstand mit all den angegebenen Informationen erstellt

  @javascript
  Szenariogrundriss: Einen Gegenstand mit einer fehlenden Pflichtangabe erstellen
    Angenommen Personas existieren
    Und man ist "Matti"
    Und man navigiert zur Gegenstandserstellungsseite
    Und man setzt Bezug auf Investition
    Und jedes Pflichtfeld ist gesetzt
    | Modell        |
    | Inventarcode  |
    | Projektnummer |
    Wenn ich das gekennzeichnete <Pflichtfeld> leer lasse
    Dann kann das Modell nicht erstellt werden
    Und ich sehe eine Fehlermeldung
    Und die anderen Angaben wurde nicht gelöscht

    Beispiele:
    | Pflichtfeld   |
    | Modell        |
    | Inventarcode  |
    | Projektnummer |
    | Anschaffungskategorie  |

  @javascript
  Szenario: Einen Gegenstand mit allen fehlenden Pflichtangaben erstellen
    Angenommen Personas existieren
    Und man ist "Matti"
    Und man navigiert zur Gegenstandserstellungsseite
    Und man setzt Bezug auf Investition
    Und kein Pflichtfeld ist gesetzt
    | Modell        |
    | Inventarcode  |
    | Projektnummer |
    | Anschaffungskategorie  |
    Dann kann das Modell nicht erstellt werden
    Und ich sehe eine Fehlermeldung

  @javascript
  Szenario: Felder die bereits vorausgefüllt sind
    Angenommen Personas existieren
    Und man ist "Matti"
    Und man navigiert zur Gegenstandserstellungsseite
    Dann ist der Barcode bereits gesetzt
    Und Letzte Inventur ist das heutige Datum
    Und folgende Felder haben folgende Standardwerte
    | Feldname         | Type             | Wert             |
    | Ausleihbar       | radio            | Nicht ausleihbar |
    | Inventarrelevant | select           | Ja               |
    | Zustand          | radio            | OK               |
    | Vollständigkeit  | radio            | OK               |
    | Anschaffungskategorie  | select     |                  |    
    
  @javascript
  Szenario: Werte für Anschaffungskategorie hinterlegen
    Angenommen Personas existieren
    Und man ist "Matti"
    Und man navigiert zur Gegenstandserstellungsseite
    Dann sind die folgenden Werte im Feld Anschaffungskategorie hinterlegt
    | Werkstatt-Technik     |
    | Produktionstechnik    |
    | AV-Technik            |
    | Musikinstrumente      |
    | Facility Management   |
    | IC-Technik/Software   |
    | Business Applications |
    
    
    
    
    
    
