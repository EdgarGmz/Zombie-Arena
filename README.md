<div align="center">

# 🧟 Coliseo Universitario — Zombies Arena

**Videojuego 2D de supervivencia en arena desarrollado en GameMaker Studio 2**

Universidad Tecnológica Santa Catarina · Agosto 2026

![GameMaker](https://img.shields.io/badge/GameMaker_Studio_2-2023.8+-black?logo=gamemaker)
![GML](https://img.shields.io/badge/Lenguaje-GML_Moderno-orange)
![Estado](https://img.shields.io/badge/Estado-En_Desarrollo-yellow)
![Licencia](https://img.shields.io/badge/Licencia-Académica-blue)

</div>

---
[![Ver Gameplay de Zombies Arena](https://img.youtube.com/vi/0e7NcmTmKkU/hqdefault.jpg)](https://www.youtube.com/watch?v=0e7NcmTmKkU)


## 📖 Descripción

Atrapado en las instalaciones de la universidad, el jugador debe sobrevivir el mayor tiempo posible contra oleadas de estudiantes "zombificados" por el estrés de los exámenes. Recolecta chatarra escolar, fabrica trampas en tiempo real y defiende tu posición hasta que la resistencia sea imposible.

> *"¡Que los exámenes no te muerdan, sobrevive al semestre!"*

---

## 🎮 Mecánicas del Juego

### 🕹️ Input Dual — Teclado & Gamepad

El control funciona simultáneamente con ambos dispositivos, sin configuración previa.

| Acción      | Teclado              | Gamepad                  |
|-------------|----------------------|--------------------------|
| Moverse     | `WASD` / `↑←↓→`     | Joystick izquierdo       |
| Apuntar     | Cursor del ratón     | Joystick derecho         |
| Disparar    | Clic izquierdo       | Gatillo derecho `RT`     |
| Craftear    | `1` `2` `3`          | `A` `B` `X`              |
| Pausar      | `Esc`                | `Start`                  |

---

### 🌊 Sistema de Oleadas

Los enemigos aparecen en los bordes del mapa en oleadas cronometradas. Hay **5 segundos de descanso** entre cada horda.

| # | Enemigo       | Oleada | Velocidad | ❤️ Salud | ⚔️ Daño        | 💀 Drop      |
|---|---------------|--------|-----------|----------|----------------|------------------|
| 1 | 🧟 Normal     | 1+     | Media     | 30       | 10             | Regla            |
| 2 | 💨 Corredor   | 3+     | Alta      | 15       | 7              | Lápiz            |
| 3 | 🛡️ Tanque    | 5+     | Baja      | 150      | 30             | Tijera           |
| 4 | ☠️ Tóxico    | 7+     | Media     | 45       | 5 + veneno     | Grapa            |
| 5 | 👹 Boss       | 9+     | Media     | 500      | 40 + proyectil | Café             |

---

### ⚙️ Crafteo en Tiempo Real

Los enemigos sueltan **chatarra escolar** al morir. El crafteo es **instantáneo y sin pausar el juego**.

| Atajo            | Ítem           | 💰 Costo              | ✨ Efecto                                |
|------------------|----------------|-----------------------|------------------------------------------|
| `[1]` / `A`      | 🪵 Barricada   | Regla ×2, Lápiz ×1   | Bloquea enemigos, absorbe daño           |
| `[2]` / `B`      | ⚡ Trampa      | Tijera ×2, Grapa ×3  | Daño masivo al primer enemigo que pise   |
| `[3]` / `X`      | ☕ Curación    | Café ×1               | Restaura 25 puntos de salud              |

---

### 🏆 Leaderboard Local — Top 10

- La oleada alcanzada se guarda automáticamente en **`leaderboard.json`** al morir.
- Ordenado de mayor a menor; se conservan solo los **10 mejores resultados**.
- 100 % local, sin API ni conexión a internet. Implementado con `json_stringify` / `json_parse`.

---

## 📁 Estructura del Proyecto

```
Zombie Arena.yyp                  ← Archivo principal del proyecto GMS2
│
├── scripts/
│   ├── player_movement/          ← Input dual: WASD + Flechas + Gamepad, normalización
│   ├── keep_in_room/             ← Mantiene al jugador dentro de los límites del room
│   ├── shooting_attack/          ← Lógica de disparo (arma de proyectiles)
│   ├── swipe_attack/             ← Lógica de ataque melee (arma de golpe)
│   ├── attack_trail/             ← Lógica del arma de rastro/lightning
│   ├── weapon_shooting/          ← Inicialización y upgrades del arma de disparo
│   ├── weapon_swipe/             ← Inicialización y upgrades del arma melee
│   ├── weapon_trail/             ← Inicialización y upgrades del arma de rastro
│   ├── get_upgrades/             ← Genera y muestra 3 cartas de mejora aleatorias
│   ├── next_wave/                ← Escala dificultad: spawn speed, HP enemigos, xp_goal
│   ├── leaderboard/              ← Top 10 local: leaderboard_save() y leaderboard_load()
│   ├── pause/                    ← Congela el juego (global.paused = true)
│   └── unpause/                  ← Reanuda el juego (global.paused = false)
│
├── objects/
│   ├── obj_game/                 ← Manager: globals, spawn de enemigos, game over, oleadas
│   ├── obj_hero/                 ← Jugador: movimiento, armas, hitpoints, sprites
│   ├── obj_hero_bullet/          ← Proyectil del jugador
│   ├── obj_hero_swipe/           ← Hitbox del ataque melee
│   ├── obj_hero_trail/           ← Hitbox del ataque de rastro
│   ├── obj_enemy/                ← Enemigo base: persigue a obj_hero, drop de loot
│   ├── obj_pumpkill/             ← Enemigo tipo 1 (disponible desde oleada 1)
│   ├── obj_pigun/                ← Enemigo tipo 2 (disponible desde oleada 3)
│   ├── obj_rooster/              ← Enemigo tipo 3 (disponible desde oleada 5)
│   ├── obj_collectable/          ← XP recogible (soltado por enemigos al morir)
│   ├── obj_heart/                ← Corazón de curación (drop aleatorio 1/10)
│   ├── obj_upgrade/              ← Carta de mejora individual
│   ├── obj_upgrade_screen/       ← Pantalla de selección de mejoras entre oleadas
│   ├── obj_game_over/            ← Pantalla de Game Over con leaderboard Top 10
│   ├── obj_template_complete/    ← Pantalla de victoria (oleada 10 completada)
│   ├── obj_pause_screen/         ← Overlay de pausa
│   ├── obj_pause_button/         ← Botón de pausa en pantalla
│   ├── obj_shadow/               ← Sombra dinámica que sigue a enemigos y héroe
│   ├── obj_text_popup/           ← Texto flotante de daño/eventos
│   ├── obj_title/                ← Pantalla de título (menú principal)
│   └── obj_button_*/             ← Botones de UI (start, retry, exit, audio, etc.)
│
├── rooms/
│   ├── rm_game/                  ← Arena de juego principal (1920×1080)
│   └── rm_menu/                  ← Menú principal
│
├── fonts/                        ← fnt_large, fnt_medium, fnt_small, fnt_small_medium, etc.
├── sprites/                      ← Sprites del héroe, enemigos, UI, decoración
└── sounds/                       ← Música y efectos de sonido
```

---

## 🛠️ Decisiones Técnicas

| Característica            | Implementación                                                               |
|---------------------------|------------------------------------------------------------------------------|
| **Lenguaje**              | GML Moderno (Structs, Constructores, Métodos)                                |
| **Input**                 | `player_movement.gml` suma teclado y gamepad en cada frame sin configuración |
| **Persistencia**          | Archivos `.json` locales con `json_stringify` / `json_parse` / `file_text_*` |
| **Single Room**           | Todo ocurre en `rm_game` (1920×1080), sin cambio de Room                     |
| **Sin pausa de crafteo**  | La UI de mejoras corre en Draw GUI sobre el juego activo                     |
| **Comentarios**           | Todo el código documentado en **español** con estilo JSDoc                   |

---

## 🚀 Cómo Ejecutar

```bash
# 1. Clona el repositorio
git clone git@github.com:EdgarGmz/Zombie-Arena.git

# 2. Abre GameMaker Studio 2 y selecciona:
#    File → Open Project → Zombie Arena.yyp

# 3. Ejecuta con F5 o el botón ▶
```

> **Requisito mínimo:** GameMaker Studio 2 versión **2023.8** o superior.

---

## 👥 Equipo de Desarrollo

| Rol                                                    | Nombre                          |
|--------------------------------------------------------|---------------------------------|
| 🎯 Director / Programador de Sistemas (POO · UI)       | Edgar Tiburcio Gómez Morán      |
| 💻 Programador Principal (Gameplay · Spawners)         | Orlando de Jesús Casas Dávila   |
| 🎨 Artista 2D / Animador (Personajes · UI)             | Carlos Alexis Rodríguez García  |
| 🗺️ Diseñador de Niveles (Tilesets · Arena)            | Juan Enrique Castillo Ontiveros |
| 🎵 Audio & QA / Testing                                | Daniela Mayte Guevara Castillo  |

---

<div align="center">

Universidad Tecnológica Santa Catarina · Proyecto de Videojuego · Agosto 2026

</div>
