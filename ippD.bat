@echo off
echo Cria novo projeto?
pause
npm init -y && npm i -D typescript ts-node && npx tsc --init && codj