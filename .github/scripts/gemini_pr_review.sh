#!/usr/bin/env bash
set -e

echo "🔍 Generando diff entre $BASE_REF y $HEAD_REF"

git fetch origin "$BASE_REF" "$HEAD_REF"

DIFF=$(git diff "origin/$BASE_REF...origin/$HEAD_REF")

if [ -z "$DIFF" ]; then
  echo "No hay cambios para analizar."
  echo "### 🤖 Gemini PR Review\n\nNo se detectaron cambios relevantes." > gemini_review.md
  exit 0
fi

PROMPT=$(cat <<EOF
Eres un **revisor experto de código**.

Analiza el siguiente \`git diff\` y genera un **comentario de revisión en Markdown** con:

### ✅ Fortalezas
### ⚠️ Problemas detectados
### 🛠️ Mejoras sugeridas (con ejemplos si aplica)
### 🔐 Seguridad (si aplica)
### 📏 Buenas prácticas

Sé claro, conciso y útil para un Pull Request.

Diff:
\`\`\`diff
$DIFF
\`\`\`
EOF
)

echo "🤖 Enviando diff a Gemini..."

echo "$PROMPT" | gemini \
  --model gemini-1.5-pro \
  --markdown > gemini_review.md

echo "✅ Análisis generado en gemini_review.md"