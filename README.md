### Установка  

- Скопировать   

```
 cp .vimrc  $HOME/  
 cp -r .vim $HOME/  
```

- Запустить vim и для скачивания/установки плагинов набрать (нажав Enter в конце)
 
```
:PlugInstall
```

- Перезапустить vim


### Дополнительная настройка neocomplete
После успешной установки плагинов описанной выше.  
Для того чтобы neocomplete начал полноценно использовать сниппеты плагина ultisnips
задаем источник данных файлом ultisnips.vim
```
cp ./ultisnips.vim ~/.vim/plugged/neocomplete.vim/autoload/neocomplete/sources/ultisnips.vim
```

### Требования к программному окружению  

- Для успешной работы используемых плагинов необходим vim c поддержкой скриптовых языков Python, Lua  
- Для работы плагинов javasctipt должны быть установлены node.js и npm  
