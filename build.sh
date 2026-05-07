#!/bin/bash
if [ -d "flutter" ]; then
  cd flutter && git pull && cd ..
else
  git clone https://github.com/flutter/flutter.git --depth 1
fi
./flutter/bin/flutter doctor
echo "SUPABASE_URL=$SUPABASE_URL" > .env
echo "SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY" >> .env
echo "GOOGLE_WEB_CLIENT_ID=$GOOGLE_WEB_CLIENT_ID" >> .env
./flutter/bin/flutter pub get
./flutter/bin/flutter build web --release
