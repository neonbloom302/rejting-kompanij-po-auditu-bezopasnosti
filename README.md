# rejting-kompanij-po-auditu-bezopasnosti.com

Статичный сайт-рейтинг компаний по аудиту ИБ.

## Работа с сайтом

```bash
bash build.sh        # собрать все страницы
node serve.mjs       # http://localhost:3000
```

- `http://localhost:3000/preview.html` показывает все брейкпоинты (360–1920 px) на одной странице.
- Редактируются только `content/`, `components/`, `css/`, `js/`, `images/`, затем `bash build.sh`.
- `content/schema/*.json` содержит JSON-LD страниц, а `content/md/*.md` — markdown-версии для `llms.txt`.
- `images/PROMPTS.md` — промпты для обложек; `TODO.md` — открытые вопросы из исходных текстов.

## Служебное (в деплой не нужно)

`_tools/` (скрипты проверки), `temporary screenshots/`, `preview.html`, `node_modules/`, `images/reference*.png`.
