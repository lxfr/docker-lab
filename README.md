# Docker\`Lab
## Быстрая интеграция, управление и обслуживание эко системы Docker в проектах.

![docker](https://user-images.githubusercontent.com/24417608/37024505-1bd0c66c-213a-11e8-83de-73b737803778.png)

## Версия
 0.1 alpha - в стадии разработки.

## Для кого это
Данное решение создано для реалий, когда требуется внедрить Docker туда, где его еще нет, и сделать это безболезненно и быстро.
Также, является инструментом по докеризации приложений, а также дальнейшего обслуживания этих приложений.

## Для начальной работы требуются:
 - OS типа Debian с поддержкой apt-get
 - установленный docker и docker-compose
 Так как установка Docker & Docker-Compose достаточно разнообразна даже для разных версий Debian/Ubuntu, скорее всего Docker Lab затребует, чтобы эти 2 программы были установлены вручную.

## Запуск
./control.sh

## Доступные ключи
-x

## Как использовать
Склонировать. Дать права ./control.sh на запуск, если их нет (chmod +x control.sh). Запустить. Развернуть эко среду Docker для вашего приложения, использовать.

## Директории проекта (компоненты)
 - mutator - директория содержит файлы компонента "Docker\`Lab: Mutator". Он нужен для того, чтобы мутировать эко-среду Docker в какой-то проект, где Docker нет, таким образом, что мы указываем определенные настройки при мутации и в дальнейшем управлять этой средой. Также управлять средой уже существующих проектов в Docker, при условии, что они созданын самим мутатором. По аналогии можно назвать это автоматической докеризацией и управлением уже докеризованными проектами.
 - addons - директория содержит файлы компонента "Docker\`Lab: Addons". Этот компонент предоставляет многие стандартные вещи для обслуживания самого Docker вне контексте конкретного проекта, например позволяет устанавливать различные сервисы обслуживания и тому подобные вещи.
 - typical - директория содержит файлы компонента "Docker\`Lab: Typical". Исходя из названия данного компонета становится понятно, что этот компонент предоставляет типичные решения для большей части проектов, например создать типичную связку Nginx + PHP + Mysql или Mongo + NodeJs. Сюда можно добавить уже готовые пустые сборки с сервисами и интегрировать их в какой-то проект. Отличие от мутатора в том, что никакие настройки здесь не задаются, это просто каталог для интеграции, а не управления или внесения каких-то изменений. 
 - другие директории служат для ядра Docker\`Lab и содержат второстепенные скрипты и файлы.


## Авторы
http://www.fdev.biz