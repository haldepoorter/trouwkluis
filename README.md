# 💍 De Trouwkluis

Een kleine "escape room" als trouwcadeau. Eén `index.html` (HTML/CSS/JS), geserveerd door nginx.

## Aanpassen

De antwoorden staan **nooit in klare tekst** in de code — enkel hun SHA-256 hash
(zo is in F12 / view-source niets af te lezen). Bovenaan de `<script>` in `index.html`:

```js
const HASH_PASSWORD    = "…";
const HASH_COORDINATES = "…";
const HASH_PIN         = "…";
```

Nieuwe hash berekenen (normaliseer eerst zoals de app: wachtwoord/coördinaten
trim + lowercase, coördinaten met exact één spatie na de komma, pin = 4 cijfers):

```sh
printf '%s' "jouw antwoord" | shasum -a 256
```

## Deployen via Portainer (Stack-from-Git)

1. Portainer → **Stacks → Add stack → Repository**.
2. Repository URL: deze repo. Compose path: `docker-compose.yml`.
3. Deploy. Portainer buildt de image zelf uit de `Dockerfile`.
4. Site bereikbaar op `http://<server-ip>:8088` (pas de poort aan in `docker-compose.yml`).

Lokaal testen:

```sh
docker compose up --build
# → http://localhost:8088
```
