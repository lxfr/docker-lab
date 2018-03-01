#!/bin/bash
needlePackage=vrotmnenogi
needleName=ВротМнеНоги
command -v $needlePackage >/dev/null 2>&1 || { echo >&2 "[ WARNING !] 
Для дальнейшей работы потребуется программа $needleName.
Пробую установить $needleName...
Сейчас потребуется пароль пользователя root.
"; sudo apt-get install $needlePackage; command -v $needlePackage >/dev/null 2>&1 || { echo "
Не удалось установить $needleName. Аварийной завершение работы. 
Пожалуйста, установите $needleName вручную чтобы продолжить работу."; exit 1; } }