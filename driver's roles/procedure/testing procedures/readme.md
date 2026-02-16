<h1>Тестирование процедуры бронирования автомобиля</h1>
<ul>
<li>
<h4>Водитель уже имеет бронь</h4>
  <h5>Его машина не доступна для бронирования</h5>
  <img align="center" width="750" src="https://github.com/OlgaSelivanova1/Service-Taxi/blob/main/driver's%20roles/procedure/testing%20procedures/img/rent_notFree.jpg">
</li>
</ul>

<ul>
<li>
<h4>Сообщение системы, если кто-то из водителей бронирует текущую машину (ID drv: 68)</h4>
  <img align="center" width="450" src="https://github.com/OlgaSelivanova1/Service-Taxi/blob/main/driver's%20roles/procedure/testing%20procedures/img/error_car_dontFree.jpg">
</li>
</ul>

<ul>
<li>
<h4>Попытка водителя с ID: 3 зарезервировать машину, имея не закрытую дату в поле DATE_STOP </h4>
  <img align="center" width="480" src="https://github.com/OlgaSelivanova1/Service-Taxi/blob/main/driver's%20roles/procedure/testing%20procedures/img/error_alreadyhasareservation.jpg">
</li>
</ul>

<ul>
<li>
<h4>Водитель (ID drv: 68) выбирает свободную машину </h4>
  <img align="center" width="550" src="https://github.com/OlgaSelivanova1/Service-Taxi/blob/main/driver's%20roles/procedure/testing%20procedures/img/result_is_true.jpg">
</li>
</ul>

<ul>
<li>
<h4>Запись в таблице RENT_CAR (ID drv: 68)</h4>
  <img align="center" width="750" src="https://github.com/OlgaSelivanova1/Service-Taxi/blob/main/driver's%20roles/procedure/testing%20procedures/img/result_true_drv83.jpg">
</li>
</ul>

