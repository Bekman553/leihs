# language: de

Funktionalität: Gruppen

  Um Benutzer in Gruppen zu organisieren und Gruppen Modell-Kapazitäten zuzuteilen
  möchte ich als Ausleih-Verwalter
  vom System Funktionalitäten bereitgestellt bekommen

  Grundlage:
    Angenommen Personas existieren
    Und ich bin Mike

  @javascript
  Szenario: Anzeige der Gruppenliste
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Dann sehe ich die Liste der Gruppen
    Und die Anzahl zugeteilter Benutzer
    Und die Anzahl der zugeteilten Modell-Kapazitäten

  @javascript
  Szenario: Gruppenliste Sortierung
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Dann sehe ich die Liste der Gruppen
    Und die Liste ist alphabetisch sortiert
  
  @javascript
  Szenario: Gruppe erstellen
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Wenn ich eine Gruppe erstelle
    Und den Namen der Gruppe angebe
    Und die Benutzer hinzufüge
    Und die Modelle und deren Kapazität hinzufüge
    Und ich speichere die Gruppe
    Dann ist die Gruppe gespeichert
    Und die Benutzer und Modelle mit deren Kapazitäten sind zugeteilt
    Und ich sehe die Gruppenliste alphabetisch sortiert
    Und ich sehe eine Bestätigung

  @javascript
  Szenario: Gruppe editieren
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Wenn ich eine bestehende Gruppe editiere
    Und ich den Namen der Gruppe ändere
    Und die Benutzer hinzufüge und entferne
    Und die Modelle und deren Kapazität hinzufüge und entferne
    Und ich speichere die Gruppe
    Dann ist die Gruppe gespeichert
    Und die Benutzer und Modelle mit deren Kapazitäten sind zugeteilt
    Und ich sehe die Gruppenliste
    Und ich sehe eine Bestätigung
  
  @javascript
  Szenario: Noch nicht zugeteilten Kapazitäten
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Wenn ich eine Gruppe erstelle
    Und die Modelle und deren Kapazität hinzufüge
    Dann sehe ich die noch nicht zugeteilten Kapazitäten

  @javascript
  Szenario: Gruppe löschen
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Wenn ich eine Gruppe lösche
    Und die Gruppe wurde aus der Liste gelöscht
    Und die Gruppe wurde aus der Datenbank gelöscht
    
  @javascript
  Szenario: Benutzer hinzufügen
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Und ich eine Gruppe editiere
    Wenn ich einen Benutzer hinzufüge
    Dann wird der Benutzer zuoberst in der Liste hinzugefügt
    
  @javascript
  Szenario: Benutzer sortieren
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Und ich eine Gruppe editiere
    Dann sind die bereits hinzugefügten Benutzer alphabetisch sortiert
  
  @javascript
  Szenario: Modelle hinzufügen
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Und ich eine Gruppe editiere
    Wenn ich ein Modell hinzufüge
    Dann wird das Modell zuoberst in der Liste hinzugefügt
    
  @javascript
  Szenario: Modelle sortieren
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Und ich eine Gruppe editiere
    Dann sind die bereits hinzugefügten Modelle alphabetisch sortiert
    
  @javascript
  Szenario: bereits bestehende Modelle hinzufügen
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Und ich eine Gruppe editiere
    Wenn ich ein bereits hinzugefügtes Modell hinzufüge
    Dann wird das Modell nicht hinzugefügt
    
  @javascript
  Szenario: bereits bestehende Benutzer hinzufügen
    Angenommen ich befinde mich im Admin-Bereich im Reiter Gruppen
    Und ich eine Gruppe editiere
    Wenn ich einen bereits hinzugefügten Benutzer hinzufüge
    Dann wird der Benutzer nicht hinzugefügt
