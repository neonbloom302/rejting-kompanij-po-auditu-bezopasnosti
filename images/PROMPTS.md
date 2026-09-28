# Промпты для изображений

## Как генерировать

- **Каждую картинку отдельно**, не листом: в листе каждая панель получает мало пикселей.
- **Размер:** 2400×960 (5:2). Если генератор не даёт 5:2, берите максимальный 16:9 или 21:9. Главный объект держите в центральной полосе высотой 60%: верх и низ я обрежу.
- **Формат:** PNG или JPG максимального качества, без сжатия и без апскейла внутри генератора.
- **Без водяных знаков**, без текста, без букв и логотипов на щитах.
- Готовый файл пришлите мне, я поставлю его на место и подгоню кадр.

## Общий стиль (добавляйте в конец каждого промпта)

```
Soft-lit 3D render, glassmorphism, frosted translucent glass and glossy spheres, clean light studio background in neutral cool grey #F3F3F5 with a faint warm-to-cool haze, accent colours strictly #F2541B (orange), #C33F8E (magenta), #6A4DFF (violet), soft bloom on light sources, gentle reflections on a glossy floor, shallow depth of field, high detail, sharp focus, minimalist premium tech aesthetic, no text, no letters, no logos, no watermark, 5:2 aspect ratio, 2400x960
```

Negative prompt: `text, letters, numbers, logo, letter V, watermark, signature, UI, dark background, neon cyberpunk, pink pastel background, blur, low resolution, jpeg artifacts, noise, distorted, cropped subject`

Щит на всех картинках **без буквы**, в духе логотипа сайта: круг, внутри две гладкие белые дуги. В промптах это `shield emblem made of two smooth white arcs, no letters`.

---

## 1. covers/chto-takoe-audit.jpg — Что такое аудит ИБ

**Смысл:** пять групп объектов проверки (периметр, сеть, приложения, процессы, сотрудники) сопоставляются с критерием через независимую оценку.
**Alt:** Специалист по информационной безопасности проверяет схему ИТ-инфраструктуры компании

```
Five glossy spheres of different sizes on the left (orange and magenta), thin glowing threads converge from them into a large frosted glass lens ring in the centre with a soft magenta core, dashed light threads continue from the lens to four violet spheres on the right, composition centred horizontally, lots of empty space
```

## 2. covers/vidy-audita.jpg — Виды аудита

**Смысл:** виды различаются глубиной: инструментальный неглубоко, пентест глубже, Red Teaming до самого дна.
**Alt:** Сравнение видов аудита безопасности: сканирование, тестирование на проникновение и организационная проверка

```
Six stacked horizontal frosted glass layers in perspective, three thin vertical light probes descend from the top to different depths: an orange sphere stops at the 2nd layer, a magenta sphere at the 4th, a violet sphere reaches the bottom layer, clean symmetrical composition, centred
```

## 3. covers/kak-provesti-audit.jpg — Как провести аудит

**Смысл:** 5 этапов по порядку внутри согласованных границ; после отчёта петля ретеста.
**Alt:** Команда аудиторов обсуждает план проверки и границы тестирования на проникновение

```
Five glossy spheres connected by a smooth glowing gradient line rising gently from left to right, colours progress orange → magenta → violet, all inside a large frosted glass rounded rectangle frame, a thin dashed light loop returns from the last violet sphere back toward the fourth sphere, centred composition
```

## 4. covers/kak-vybrat-kompaniyu.jpg — Как выбрать компанию

**Смысл:** поток подрядчиков проходит 6 критериев-фильтров, до конца доходит один проверенный.
**Alt:** Руководитель службы ИБ сравнивает коммерческие предложения подрядчиков по аудиту

```
A dense cloud of tiny orange, magenta and violet particles flows from the left through six vertical frosted glass panels standing in a row, fewer particles pass each panel, on the right the remaining stream converges into a glowing violet sphere with a shield emblem made of two smooth white arcs, no letters, centred composition
```

## 5. covers/stoimost-audita.jpg — Стоимость аудита

**Смысл:** нижние опубликованные цены по видам работ на логарифмической шкале; Red Teaming в разы дороже остальных.
**Alt:** Смета на аудит информационной безопасности с перечнем систем и видов работ

```
Six vertical glass tubes filled with glowing gradient liquid (orange at the bottom to violet at the top) standing on a glossy floor, five of them similar medium height, the sixth on the right three times taller with a violet glowing sphere on top, each tube topped with a small glowing sphere, soft reflections, centred composition
```

## 6. og-cover.jpg — превью в соцсетях · 2400×1260 (1.91:1)

**Alt:** Рейтинг аудиторов ИБ: аудит безопасности, рейтинг компаний 2026
Левые 55% кадра оставьте пустыми: туда я добавлю название и заголовок.

```
On the right side: eight equal glossy spheres (orange, magenta, violet) arranged evenly on a thin dashed light ring, in the centre of the ring a glowing gradient sphere with a shield emblem made of two smooth white arcs, no letters; left 55% of the frame is empty clean background, 1.91:1 aspect ratio, 2400x1260
```

---

## Скриншоты компаний (не генерировать)

`images/brands/*.jpg`, 1440×900: первый экран официального сайта компании. Сгенерированная картинка на этом месте была бы подделкой. Все 8 скриншотов сняты 29.09.2026; F6, Бастион и «Инфосистемы Джет» сняты с копий Web Archive, так как из сети сборки их сайты не открылись.
