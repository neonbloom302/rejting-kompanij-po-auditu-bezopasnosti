# Промпты для изображений

Сгенерируйте картинку по промпту и сохраните её в `images/` под указанным именем, в формате JPG. Заглушка заменится автоматически: пересобирать сайт не нужно.

Общий стиль для всех картинок: светлая редакционная фотография или 3D-иллюстрация, чистый светло-серый фон `#F3F3F5`, акценты оранжевым `#F2541B` и фиолетовым `#6A4DFF`, мягкий рассеянный свет, много воздуха. Без текста, логотипов, водяных знаков и узнаваемых лиц; экраны без читаемых надписей.

Negative prompt (для всех): `text, letters, logo, watermark, brand names, readable UI text, dark theme, neon, hacker in hoodie, matrix code, skulls, padlock clichés, distorted hands, extra fingers`

---

## 1. covers/chto-takoe-audit.jpg · 1200×480 (5:2)

**Alt:** Специалист по информационной безопасности проверяет схему ИТ-инфраструктуры компании

```
Editorial wide photo, a security specialist in a light modern office reviewing an abstract IT infrastructure diagram on a large monitor, nodes and connection lines in orange and violet, soft daylight, shallow depth of field, light grey background, calm analytical mood, 5:2 aspect ratio, high detail
```

## 2. covers/vidy-audita.jpg · 1200×480 (5:2)

**Alt:** Сравнение видов аудита безопасности: сканирование, тестирование на проникновение и организационная проверка

```
Minimal 3D illustration, three floating translucent panels side by side on a light grey background: a radar-like scan pattern, a layered network with one highlighted path, a stack of documents with checkmarks; orange-to-violet gradient accents, soft shadows, isometric view, clean composition, 5:2 aspect ratio
```

## 3. covers/kak-provesti-audit.jpg · 1200×480 (5:2)

**Alt:** Команда аудиторов обсуждает план проверки и границы тестирования на проникновение

```
Editorial wide photo, three professionals at a white meeting table discussing a project plan, a laptop and printed timeline with five colored stages, sticky notes in orange and violet, bright Scandinavian office, natural light, faces turned away or out of focus, 5:2 aspect ratio
```

## 4. covers/kak-vybrat-kompaniyu.jpg · 1200×480 (5:2)

**Alt:** Руководитель службы ИБ сравнивает коммерческие предложения подрядчиков по аудиту

```
Top-down editorial photo of a light desk, hands comparing two printed proposals side by side with a pen, a checklist with checkmarks, a tablet showing an abstract comparison table, orange and violet stationery accents, soft daylight, minimal, 5:2 aspect ratio
```

## 5. covers/stoimost-audita.jpg · 1200×480 (5:2)

**Alt:** Смета на аудит информационной безопасности с перечнем систем и видов работ

```
Minimal 3D illustration, an abstract cost estimate document with rows of blank lines and a bar chart where bars fade from orange to violet, a calculator and a small server rack model nearby, light grey background, soft studio lighting, clean isometric composition, 5:2 aspect ratio
```

## 6. og-cover.jpg · 1200×630 (1.91:1)

**Alt:** Рейтинг компаний по аудиту безопасности 2026

```
Clean abstract hero image for a security audit ranking website, a round shield emblem made of two white arcs on an orange-to-violet gradient circle, floating above a light grey surface with subtle dashboard cards and a bar chart, soft shadows, lots of empty space on the left for a headline, 1.91:1 aspect ratio
```

---

## Скриншоты компаний (не генерировать)

`images/brands/*.jpg`, 1440×900: первый экран официального сайта компании. Сгенерированная картинка на этом месте была бы подделкой. Скриншоты снимает `node _tools/brand-shots.mjs`; из сети сборки не открылись сайты Positive Technologies, F6, Бастиона и «Инфосистемы Джет». Снимите их из браузера на 1440×900 без cookie-баннеров и сохраните как `positive-technologies.jpg`, `f6.jpg`, `bastion.jpg`, `jet.jpg`.
