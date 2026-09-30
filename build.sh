#!/usr/bin/env bash
# Assembles all pages from components/ + content/ into */index.html
# Usage: bash build.sh
set -euo pipefail
cd "$(dirname "$0")"

DOMAIN="https://rejting-kompanij-po-auditu-bezopasnosti.com"
HEADER="components/header.html"
FOOTER="components/footer.html"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# build_page OUT TITLE DESCRIPTION PATH OG_TITLE OG_DESC CONTENT ACTIVE_NAV DEPTH CSS [OG_TYPE]
build_page() {
  local OUT="$1" TITLE="$2" DESC="$3" PAGE_PATH="$4" OG_TITLE="$5" OG_DESC="$6"
  local CONTENT="$7" ACTIVE_NAV="$8" DEPTH="$9" CSS="${10}" OG_TYPE="${11:-article}"
  local OG_IMAGE="${DOMAIN}/images/og-cover.jpg"
  local OG_IMAGE_ALT="Рейтинг аудиторов ИБ: аудит безопасности, рейтинг компаний 2026"
  local NAME; NAME="$(basename "$CONTENT" .html)"
  local BASE="" ROOT_HREF="./"
  if [ "$DEPTH" -gt 0 ]; then
    BASE="$(printf '../%.0s' $(seq 1 "$DEPTH"))"
    ROOT_HREF="$BASE"
  fi
  local CANONICAL="${DOMAIN}${PAGE_PATH}"
  local TMP_HEADER="$TMP_DIR/header.html" TMP_FOOTER="$TMP_DIR/footer.html" TMP_CONTENT="$TMP_DIR/content.html"

  sed \
    -e "s|href=\"$ACTIVE_NAV\" data-nav|href=\"$ACTIVE_NAV\" class=\"active\" aria-current=\"page\" data-nav|g" \
    -e "s|href=\"/\"|href=\"${ROOT_HREF}\"|g" \
    -e "s|href=\"/\([^\"]*\)\"|href=\"${BASE}\1\"|g" \
    -e "s|src=\"/\([^\"]*\)\"|src=\"${BASE}\1\"|g" \
    "$HEADER" > "$TMP_HEADER"

  for pair in "$FOOTER:$TMP_FOOTER" "$CONTENT:$TMP_CONTENT"; do
    sed \
      -e "s|href=\"/\"|href=\"${ROOT_HREF}\"|g" \
      -e "s|href=\"/\([^\"]*\)\"|href=\"${BASE}\1\"|g" \
      -e "s|src=\"/\([^\"]*\)\"|src=\"${BASE}\1\"|g" \
      "${pair%%:*}" > "${pair##*:}"
  done

  mkdir -p "$(dirname "$OUT")"
  {
    echo '<!DOCTYPE html>'
    echo '<html lang="ru">'
    echo '<head>'
    echo '<meta charset="utf-8">'
    echo '<meta name="viewport" content="width=device-width, initial-scale=1">'
    echo "<title>${TITLE}</title>"
    echo "<meta name=\"description\" content=\"${DESC}\">"
    echo "<link rel=\"canonical\" href=\"${CANONICAL}\">"
    echo '<meta name="robots" content="index, follow">'
    echo "<meta property=\"og:type\" content=\"${OG_TYPE}\">"
    echo '<meta property="og:locale" content="ru_RU">'
    echo '<meta property="og:site_name" content="Рейтинг аудиторов ИБ">'
    echo "<meta property=\"og:title\" content=\"${OG_TITLE}\">"
    echo "<meta property=\"og:description\" content=\"${OG_DESC}\">"
    echo "<meta property=\"og:url\" content=\"${CANONICAL}\">"
    echo "<meta property=\"og:image\" content=\"${OG_IMAGE}\">"
    echo '<meta property="og:image:type" content="image/jpeg">'
    echo '<meta property="og:image:width" content="1200">'
    echo '<meta property="og:image:height" content="630">'
    echo "<meta property=\"og:image:alt\" content=\"${OG_IMAGE_ALT}\">"
    echo '<meta name="twitter:card" content="summary_large_image">'
    echo "<meta name=\"twitter:title\" content=\"${OG_TITLE}\">"
    echo "<meta name=\"twitter:description\" content=\"${OG_DESC}\">"
    echo "<meta name=\"twitter:image\" content=\"${OG_IMAGE}\">"
    echo "<meta name=\"twitter:image:alt\" content=\"${OG_IMAGE_ALT}\">"
    echo '<meta name="theme-color" content="#F3F3F5">'
    echo "<link rel=\"icon\" href=\"${BASE}favicon.svg\" type=\"image/svg+xml\">"
    echo "<link rel=\"icon\" href=\"${BASE}favicon.ico\" sizes=\"32x32\">"
    echo "<link rel=\"apple-touch-icon\" href=\"${BASE}apple-touch-icon.png\">"
    echo "<link rel=\"alternate\" type=\"text/markdown\" href=\"index.md\">"
    echo '<link rel="preconnect" href="https://fonts.googleapis.com">'
    echo '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>'
    echo '<link href="https://fonts.googleapis.com/css2?family=Geologica:wght@400;500;600;700&display=swap" rel="stylesheet">'
    echo "<link rel=\"stylesheet\" href=\"${BASE}css/global.css\">"
    echo "<link rel=\"stylesheet\" href=\"${BASE}css/${CSS}\">"
    echo '<script type="application/ld+json">'
    cat "content/schema/${NAME}.json"
    echo '</script>'
    echo '</head>'
    echo '<body>'
    cat "$TMP_HEADER"
    echo '<main id="main">'
    cat "$TMP_CONTENT"
    echo '</main>'
    cat "$TMP_FOOTER"
    echo '</body>'
    echo '</html>'
  } > "$OUT"

  # Markdown version next to HTML (for llms.txt)
  cp "content/md/${NAME}.md" "$(dirname "$OUT")/index.md"
  echo "built $OUT"
}

build_page "index.html" \
  "Рейтинг компаний по аудиту безопасности: 8 аудиторов ИБ" \
  "Рейтинг компаний по аудиту безопасности 2026: 8 аудиторов ИБ с лицензией ФСТЭК. Сравнение цен, сроков и видов аудита — выберите подрядчика за 5 минут." \
  "/" \
  "Рейтинг компаний по аудиту безопасности в России" \
  "Рейтинг 8 компаний по аудиту безопасности: лицензии ФСТЭК, виды аудита, публичные исследования и цены на 2026 год." \
  "content/main-ranking.html" "/" 0 "ranking.css"

build_page "chto-takoe-audit-informacionnoj-bezopasnosti/index.html" \
  "Аудит информационной безопасности: что это и что проверяют" \
  "Что такое аудит информационной безопасности: объекты и критерии проверки, технический и организационный аудит ИБ, отличия от пентеста и Red Teaming." \
  "/chto-takoe-audit-informacionnoj-bezopasnosti/" \
  "Что такое аудит информационной безопасности" \
  "Объекты и критерии проверки, технический и организационный аудит, отличия от пентеста и Red Teaming." \
  "content/chto-takoe-audit.html" "/chto-takoe-audit-informacionnoj-bezopasnosti/" 1 "article.css"

build_page "vidy-audita-bezopasnosti/index.html" \
  "Виды аудита безопасности: сравнение по срокам и цене" \
  "Виды аудита безопасности: внутренний и внешний аудит, инструментальная проверка, пентест и Red Teaming. Чем отличаются, сколько длятся и что выбрать." \
  "/vidy-audita-bezopasnosti/" \
  "Виды аудита безопасности" \
  "Внутренний и внешний аудит, инструментальная проверка, пентест и Red Teaming по глубине, срокам и цене." \
  "content/vidy-audita.html" "/vidy-audita-bezopasnosti/" 1 "article.css"

build_page "kak-provesti-audit-informacionnoj-bezopasnosti/index.html" \
  "Как провести аудит информационной безопасности: 5 этапов" \
  "Как провести аудит информационной безопасности: подготовка и документы, 5 этапов проведения аудита ИБ, сроки, состав отчёта и ретест уязвимостей." \
  "/kak-provesti-audit-informacionnoj-bezopasnosti/" \
  "Как провести аудит информационной безопасности" \
  "Подготовка к аудиту ИБ, 5 этапов проведения, сроки, состав отчёта и ретест после устранения уязвимостей." \
  "content/kak-provesti-audit.html" "/kak-provesti-audit-informacionnoj-bezopasnosti/" 1 "article.css"

build_page "kak-vybrat-kompaniyu-dlya-audita/index.html" \
  "Как выбрать компанию для аудита ИБ: 6 критериев" \
  "Как выбрать компанию для аудита ИБ: лицензия ФСТЭК в реестре, публичные исследования, образец отчёта и 8 вопросов подрядчику до подписания договора." \
  "/kak-vybrat-kompaniyu-dlya-audita/" \
  "Как выбрать компанию для аудита ИБ" \
  "6 критериев, проверка лицензии в реестре ФСТЭК и 8 вопросов подрядчику до договора." \
  "content/kak-vybrat-kompaniyu.html" "/kak-vybrat-kompaniyu-dlya-audita/" 1 "article.css"

build_page "stoimost-audita-ib/index.html" \
  "Стоимость аудита ИБ в 2026: цены на пентест по прайсам" \
  "Стоимость аудита ИБ и пентеста в 2026: опубликованные цены компаний рынка, от чего зависит стоимость аудита, что входит в смету и признаки демпинга." \
  "/stoimost-audita-ib/" \
  "Стоимость аудита информационной безопасности" \
  "Опубликованные цены RTM Group, РАД КОП и SecurityLab.Pro, факторы стоимости и проверка сметы." \
  "content/stoimost-audita.html" "/stoimost-audita-ib/" 1 "article.css"

build_page "metodologiya/index.html" \
  "Методология рейтинга: критерии, баллы и источники данных" \
  "Как составлен рейтинг компаний по аудиту безопасности: 6 критериев, шкала баллов, источники данных и журнал изменений." \
  "/metodologiya/" \
  "Методология рейтинга компаний по аудиту безопасности" \
  "6 критериев, 100 баллов, только открытые источники и журнал изменений." \
  "content/metodologiya.html" "/metodologiya/" 1 "article.css" "website"

build_page "redakciya/index.html" \
  "Редакция рейтинга аудиторов ИБ: кто проверяет данные" \
  "Кто ведёт рейтинг компаний по аудиту безопасности, как редакция проверяет данные и какие статьи подготовила." \
  "/redakciya/" \
  "Редакция рейтинга компаний по аудиту безопасности" \
  "Как редакция собирает и проверяет данные о компаниях рейтинга." \
  "content/redakciya.html" "/redakciya/" 1 "article.css" "website"

build_page "dobavit-kompaniyu/index.html" \
  "Добавить компанию в рейтинг аудиторов ИБ: заявка" \
  "Как компании по аудиту информационной безопасности попасть в рейтинг или исправить данные: какие сведения нужны, как идёт оценка, форма заявки и контакты." \
  "/dobavit-kompaniyu/" \
  "Добавить компанию в рейтинг" \
  "Заявка на включение в рейтинг и исправление данных о компании." \
  "content/dobavit-kompaniyu.html" "/dobavit-kompaniyu/" 1 "article.css" "website"

build_page "pravovaya-informaciya/index.html" \
  "Правовая информация: данные, условия и cookies" \
  "Политика обработки персональных данных, условия использования рейтинга и cookies." \
  "/pravovaya-informaciya/" \
  "Правовая информация" \
  "Персональные данные, условия использования и cookies." \
  "content/pravovaya-informaciya.html" "/pravovaya-informaciya/" 1 "article.css" "website"

# robots.txt, sitemap.xml
PATHS="/ /chto-takoe-audit-informacionnoj-bezopasnosti/ /vidy-audita-bezopasnosti/ /kak-provesti-audit-informacionnoj-bezopasnosti/ /kak-vybrat-kompaniyu-dlya-audita/ /stoimost-audita-ib/ /metodologiya/ /redakciya/ /dobavit-kompaniyu/ /pravovaya-informaciya/"
{
  echo 'User-agent: *'
  echo 'Allow: /'
  echo 'Disallow: /_source/'
  echo 'Disallow: /_tools/'
  echo 'Disallow: /content/'
  echo 'Disallow: /components/'
  echo 'Disallow: /preview.html'
  echo ''
  echo "Sitemap: ${DOMAIN}/sitemap.xml"
} > robots.txt
{
  echo '<?xml version="1.0" encoding="UTF-8"?>'
  echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
  for p in $PATHS; do
    echo "  <url><loc>${DOMAIN}${p}</loc><lastmod>2026-09-29</lastmod></url>"
  done
  echo '</urlset>'
} > sitemap.xml
touch .nojekyll
echo "done"
