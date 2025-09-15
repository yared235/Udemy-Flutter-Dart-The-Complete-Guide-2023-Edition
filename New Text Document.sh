#!/bin/bash
# -----------------------------------
# Udemy Flutter & Dart Course Projects
# One commit per section
# -----------------------------------

# 1. Init new git repo
git init
git checkout -b main

# 2. Create README
cat > README.md <<'EOF'
# Udemy – Flutter & Dart: The Complete Guide (2023 Edition)

This repository contains projects built while following the course.

Each section has its own Flutter project, committed separately.
EOF

git add README.md
git commit -m "docs: add course README"

# 3. Import Section Projects
# ⚠️ Adjust path if needed — this assumes your folders are in:
# /g/[FreeCourseSite.com] Udemy - Flutter Dart The Complete Guide 2023 Edition/my projects

SOURCE="/g/[FreeCourseSite.com] Udemy - Flutter Dart The Complete Guide 2023 Edition/my projects/flutter_projects"

# Section 02
cp -r "$SOURCE/sec2_first_app" "Section-02-Roll-Dice-App"
git add .
git commit -m "feat: add Section 02 - Roll Dice App"

# Section 03
cp -r "$SOURCE/sec3_adv_basics" "Section-03-Quiz-App"
git add .
git commit -m "feat: add Section 03 - Quiz App"

# Section 04
cp -r "$SOURCE/sec4_debug_apps" "Section-04-Debug-Apps"
git add .
git commit -m "feat: add Section 04 - Debug Apps"

# Section 05
cp -r "$SOURCE/sec5_interactive" "Section-05-Expense-Tracker"
git add .
git commit -m "feat: add Section 05 - Expense Tracker App"

# Section 06
cp -r "$SOURCE/sec6_adaptive" "Section-06-Adaptive-UI"
git add .
git commit -m "feat: add Section 06 - Adaptive UI App"

# Section 07
cp -r "$SOURCE/sec7_internals2" "Section-07-Todo-App"
git add .
git commit -m "feat: add Section 07 - Todo App"

# Section 08
cp -r "$SOURCE/sec8_multiscreen_app" "Section-08-Meals-MultiScreen"
git add .
git commit -m "feat: add Section 08 - Meals MultiScreen App"

# Section 09
cp -r "$SOURCE/sec9_wide_state" "Section-09-Appwide-State"
git add .
git commit -m "feat: add Section 09 - Appwide State (Meals App)"

# Section 10
cp -r "$SOURCE/sec10_animation" "Section-10-Animations"
git add .
git commit -m "feat: add Section 10 - Animations (Meals App)"

# Section 11
cp -r "$SOURCE/sec11_handling_user_input" "Section-11-Forms-Input"
git add .
git commit -m "feat: add Section 11 - Forms & User Input (Shopping List App)"

# Section 12
cp -r "$SOURCE/sec12" "Section-12-HTTP-Requests"
git add .
git commit -m "feat: add Section 12 - HTTP Requests (Shopping List App)"

# Section 13
cp -r "$SOURCE/sec13" "Section-13-Favorite-Places"
git add .
git commit -m "feat: add Section 13 - Favorite Places App"

# Done
echo "✅ All sections committed!"
