<h1>Сервис "Такси"<h1>
<h4>Материалы предназначены исключительно для презенации навыков как специалиста в области PL/SQL разработки в СУБД #Oracle<h4>
<h4>Также демонстрируются навыки в работе с архитектурой БД:<h4>
<ul>
  <li>создание схемы</li>
  <li>разграничение прав доступа</li>
  <li>колонки</li>
  <li>связи</li>
   <li>определение уникальных ограничений</li>
  <li>наложение индексов на колонки</li>
  <li>триггеры для автоматизации некоторых процессов</li>
</ul>
<h4>Применяемые технологии:<h4>
<ul>
  <li>Oracle SQL Developer</li>
  <li>Oracle Database 18c Express Edition</li>
  <li>Облачное приложение ORACLE APEX</li>
</ul
<h4>Инструменты создания приложения<h4>
<ul>
  <li>Процедура</li>
  <li>Функция</li>
  <li>Триггер</li>
  <li>Пакет</li>
  <h4>Вспомогательные:<h4>
    <li>SQL-запрос</li>
      <ul>
        <li>в составе процедур/функций</li>
        <li>аналитичексий для построения графиков и дашбродов</li>
        </ul
    <li>Курсоры</li>
      <ul>
        <li>явный</li>
        <li>неявный</li>
        <li>REF CURSOR</li>
        </ul 
      <li>Коллекции TYPE <name_type_record> IS RECORD 
        TYPE <name_tbl_type> IS TABLE OF <name_type_record> INDEX BY PLS_INTEGER;
        с BULK COLLECT INTO. 
      </li>
</ul
<h4>Роли и их возможности<h4>
<ul>
  <li>Водитель</li>
    <ul>
      <li>Бронирует автомобиль</li>
      <li>Снимает автомобиль с брони</li>
      <li>Назначается системой пассажиру</li>
      <ul><li><h6>PROCEDURE insert_driver2order</h6></li></ul>
      <li>Проставляет оценку пассажиру</li>
      <li>Получает оценку от пассажира</li>
      PROCEDURE PROC_driver_rating2+collect is record
      <li>Получает средний рейтинг за определеное время</li>
      PROCEDURE proc_result_rtng(p_day IN NUMBER)
    </ul>
  <li>Пассажир</li>
    <ul>
      <li>Создает заказ</li>
          <h5>Реакция системы:</h5>
          <ul>
          <li><h6>Назначает водителя(INSERT- запись в таблице ORDERS(ID_DRIVER))</li>
            PROCEDURE insert_driver2order
          <li>Определяет коэффициент для суммы оплаты</li>
           PROCEDURE p_koeff4Order          
          <li>Высчитывает дистанцию и время в пути</li>
          PROCEDURE count_time_order
          <li>Определяет итоговую сумму к оплате с учетом показателей</li>
          FUNCTION func_amount2pay_order
          <li>Производит DDL операции для таблицы way (insert) c итоговой информацией о поездке</li>
          PROCEDURE Insert_2_way
        </ul></h6>
    <ul>   
      <li>Проставляет оценку водителю после завершения заказа </li>
      status in ('trip_completed'->'canceled')
      <li>Получает оценку от водителя</li>
        proc_canceled_order
      <li>Получает средний рейтинг за определеное время</li>
        PROCEDURE update_rating_pass(p_day IN NUMBER)
    </ul>
  <li>Специалист-аналитик сервиса</li>
      <li>Имеет возможность выгружать различного рода отчеты из Сервиса</li>
          pkg_salary_drivers.func_salary_drivers(pipe function)
          </ul>

