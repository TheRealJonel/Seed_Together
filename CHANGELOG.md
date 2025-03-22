# 📦 Changelog

## [1.0.0] – 2025-03-22
### ✨ Hinzugefügt
- 🧾 Registrierung integriert: Signup-Screen verbunden & Button in Login ergänzt
- ✨ Registrierung hinzugefügt: Nutzer können sich nun direkt über die App anmelden
- 🧹 Ordnerstruktur final bereinigt: main.dart & Screens korrekt einsortiert
- 🔥 Projekt aufgeräumt: Alte login_screen.dart entfernt für klare Struktur
- ➡️ Automatische Weiterleitung zum Profil bei aktivem Login-Status
- 🔐 Automatischer Login: Nutzer bleiben nach erfolgreichem Login eingeloggt
- 🚀 App-Startzeit verbessert
- 🌿 Neues Feature: Pflanzenbilder können jetzt hochgeladen werden
- Supabase Login & Reset-Flow
- Deep Linking (Android)
- .env eingebunden für Supabase-Zugriff
- Passwort-Reset-Screen & Login-Screen implementiert

### 🛠️ Behoben
- pubspec.yaml Einrückung
- Deep Link Routing & getInitialUri entfernt

### ✅ Status
- App kompiliert und erfolgreich getestet
## []
### ✨ Features
- Registrierung: E-Mail-Bestätigung eingebaut
- Weiterleitung nach Registrierung zur Login-Seite
- Erfolgreiche Anmeldung öffnet direkt das Profil

### 🐛 Bugfixes
- Fehlerhafte Bild-URL löst keinen Absturz mehr aus
- Registrierung/Login zeigen jetzt korrekt eine Rückmeldung (SnackBar)

### 💄 UX
- Benutzerführung verbessert (Snackbars nach Aktionen)
- Visuelles Feedback beim Registrieren & Einloggen
