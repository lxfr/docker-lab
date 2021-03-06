#!/bin/bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - 
version="0.1 Alpha"
os="Debian, Ubuntu"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - 
# Требуемый софт для работы Docker Lab.
initialSoftware=(docker docker-compose dialog git)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - 
# Инсталлируем требуемые пакеты и проверяем поставилось ли.
function install {	
	command -v $needlePackage >/dev/null 2>&1 || { echo >&2 "[ WARNING !] 
	Для дальнейшей работы потребуется программа $needlePackage.
	Пробую установить $needlePackage...
	Сейчас потребуется пароль пользователя root.
	"; sudo apt-get install $needlePackage; command -v $needlePackage >/dev/null 2>&1 || { echo "
	Не удалось установить $needlePackage. Аварийной завершение работы. 
	Пожалуйста, установите $needlePackage вручную чтобы продолжить работу."; exit 1; } }
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - 
# Говори юзеру что-то либо нативно в консоли либо в диалоге
function blablabla {
	# todo - эту хрень заменить на command -v
	I=`dpkg -s dialog | grep "Status" ` #проверяем состояние пакета (dpkg) и ищем в выводе его статус (grep)
if [ -n "$I" ] #проверяем что нашли строку со статусом (что строка не пуста)
then
   dialog --title "Docker Lab:" --msgbox "$*" 12 40
else
   echo $1
fi	
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - 
# Инициализация Docker Lab.
function init {
	echo "Запуск Docker Lab..."

	# Смотрим, есть ли весь нужный нам софт.
	for needlePackage in ${initialSoftware[*]}
	do
	    install $needlePackage
	done
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - 
# Если инициализация Docker Lab прошла успешно говорим юзеру Привет.
function helloWorld {
	dialog --title 'Запуск Docker Lab' --yesno 'Запускаем Docker Lab?' 10 40
 
	case "$?" in
	    '0')		
		blablabla "Данная версия $version для $os находится в разработке... Для тестирования работы параметров можно запустить с ключом -x"	    	   
	    ;;
	    '1')
	    echo "До новых встреч!"
	    clear
	    exit
	    ;;
	    '-1')
	    echo 'Вы вышли, нажав ESC. До новых встреч!'
	    clear
	    exit 1
	    ;;
	esac
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - 
# void() method :) который собирает всё-всё-всё.
function void {
	# Инициализация
	init initialSoftware
	# Запускаемся
	helloWorld	
	# Уходим в закат
	blablabla "Docker Lab завершил работу."
	clear
}
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - 
# Основное тело - проверки, запуск VOID.
# Задел на будущее - поддержка переменных для работы в SILENT режиме.
while [ -n "$1" ]
do
case "$1" in
-x) 
blablabla "Однажды, в студёную зимнюю пору, лошадка примерзла пиписькой к забору."
blablabla "Лошадка туда, лошадка обратно. Лошадке не больно, лошадке приятно."
blablabla "Теперь у лошадки великое горе: пиписька осталась висеть на заборе."
blablabla "Она и лягалась, она и брыкалась. Лашадка ушла, а пиписька осталась."
clear
exit
;;
#-b) echo "Нашли -y option" ;;
#-c) echo "Нашли -z option" ;;
#*) echo "$1 такой ключ нельзя использовать." exit;; #исправить эту поеботу.
esac
shift
done

void
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - 
# Ты достиг дна.