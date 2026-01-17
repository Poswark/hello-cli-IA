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
Actúa como un Ingeniero de Software Senior y Revisor de Código. 
Tu única tarea es evaluar la calidad técnica de los cambios en este Pull Request, centrándote especialmente en la lógica de 'main.py' si está presente.

Por favor, estructura tu respuesta de la siguiente manera:

### 🔍 Análisis Técnico
- **Eficiencia:** ¿Hay algoritmos ineficientes o redundantes?
- **Legibilidad:** ¿El código sigue PEP 8 (si es Python) y es fácil de mantener?
- **Robustez:** ¿Falta manejo de errores o validación de entradas?

### 🚩 Errores Críticos y Bugs
- Identifica cualquier fallo lógico o potencial crash.

### 💡 Refactorización Sugerida
- Proporciona un bloque de código corto con una versión mejorada de las partes más débiles.

### 🧪 Sugerencias de Tests
- ¿Qué casos de prueba deberían agregarse para validar estos cambios?

Diff del código:
\`\`\`diff
$DIFF
\`\`\`
EOF
)

echo "🤖 Enviando diff a Gemini..."


# Eliminamos --markdown que no existe y pasamos el prompt correctamente
echo "$PROMPT" | gemini --model gemini-2.5-flash > gemini_review.md


echo "✅ Análisis generado en gemini_review.md"
cat gemini_review.md