### Установка  

- Скопировать   

```
 cp .vimrc  $HOME/  
 cp -r .vim $HOME/  
```

- Запустить vim и для скачивания/установки плагинов выполнить
 
```
:PlugInstall
```

- Перезапустить vim


### Дополнительная настройка neocomplete
Для того чтобы neocomplete начал полноценно использовать сниппеты плагина ultisnips
задаем источник данных файлом ultisnips.vim
```
cp ./ultisnips.vim ~/.vim/plugged/neocomplete.vim/autoload/neocomplete/sources/ultisnips.vim
```
