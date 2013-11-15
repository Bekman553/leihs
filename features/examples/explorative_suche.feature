# language: de

Funktionalität: Explorative Suche

  Um Modelle anhand von Kategorien explorativ zu entdecken
  möchte ich als Benutzer
  eine entsprehende Interaktionsmöglichkeit haben

  Grundlage:
    Angenommen Personas existieren
    Und man ist "Pius"
  
  @javascript  
  Szenario: Explorative Suche in der Liste des Inventars
    Angenommen man öffnet die Liste des Inventars
    Und ich die Navigation der Kategorien aufklappe
    Wenn ich eine Kategorie anwähle
    Dann sehe ich die darunterliegenden Kategorien
    Und kann die darunterliegende Kategorie anwählen
    Und ich sehe die Hauptkategorie sowie die aktuell ausgewählte und die darunterliegenden Kategorien
    Und das Inventar wurde nach dieser Kategorie gefiltert
    Und ich kann in einem Schritt auf die aktuelle Hauptkategorie zurücknavigieren
    Und ich kann in einem Schritt auf die Übersicht der Hauptkategorien zurücknavigieren
    Wenn ich die Navigation der Kategorien wieder zuklappe
    Dann sehe ich nur noch die Liste des Inventars

  @javascript
  Szenario: Kategorie in der explorativen Suche suchen
    Angenommen man öffnet die Liste des Inventars
    Und die Navigation der Kategorien ist aufgeklappt
    Wenn ich nach dem Namen einer Kategorie suche
    Dann werden alle Kategorien angezeigt, welche den Namen beinhalten
    Und ich wähle eine Kategorie
    Dann sehe ich die darunterliegenden Kategorien
    Und kann die darunterliegende Kategorie anwählen
    Und ich sehe ein Suchicon mit dem Namen des gerade gesuchten Begriffs sowie die aktuell ausgewählte und die darunterliegenden Kategorien
    Und das Inventar wurde nach dieser Kategorie gefiltert

  @javascript
  Szenario: Zurücknavigieren in der explorativen Suche
    Angenommen ich befinde mich in der Unterkategorie der explorativen Suche
    Dann kann ich in die übergeordnete Kategorie navigieren

  @javascript
  Szenario: Explorative Suche in der Liste der Modelle
    Angenommen ich befinde mich in der Liste der Modelle
    Und ich die Navigation der Kategorien aufklappe
    Wenn ich eine Kategorie anwähle
    Dann sehe ich die darunterliegenden Kategorien
    Und kann die darunterliegende Kategorie anwählen
    Und ich sehe die Hauptkategorie sowie die aktuell ausgewählte und die darunterliegenden Kategorien
    Und die Modelle wurden nach dieser Kategorie gefiltert    