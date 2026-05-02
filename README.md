# 1. Repo klonen
git clone https://github.com/DEIN-GITHUB-NAME/fleet-damage-app.git
cd fleet-damage-app

# 2. Vite React + TypeScript Projekt anlegen
npm create vite@latest . -- --template react-ts
npm install

# 3. Zusätzliche Pakete installieren
npm install @supabase/supabase-js lucide-react @tanstack/react-query
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

# 4. Dateien ersetzen / anlegen (siehe unten)
