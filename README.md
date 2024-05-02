# Проектирование баз данных

Необходимо спроектировать базу данных ПОСТАВКА ТОВАРОВ  

В БД должна храниться информация:  
- о ТОВАРАХ : код товара, наименование товара, цена товара;  
- ЗАКАЗАХ на поставку товаров: код заказа, наименование заказчика, адрес заказчика, телефон, номер договора, дата заключения договора, наименование товара, плановая поставка (шт.);  
- фактических ОТГРУЗКАХ товаров: код отгрузки, код заказа, дата отгрузки, отгружено товара (шт.).  

При проектировании БД необходимо учитывать следующее:  
• товар имеет несколько заказов на поставку. Заказ соответствует одному товару;  
• товару могут соответствовать несколько отгрузок. В отгрузке могут участвовать несколько товаров.  

Кроме того следует учесть:  
• товар не обязательно имеет заказ. Каждому заказу обязательно соответствует товар;  
• товар не обязательно отгружается заказчику. Каждая отгрузка обязательно соответствует некоторому товару.  